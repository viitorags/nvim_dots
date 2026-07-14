local LEFT_CAP = '\u{e0b6}'
local RIGHT_CAP = '\u{e0b4}'

local function setup_inlay_hints()
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end,
  })

  local function hl(name)
    return vim.api.nvim_get_hl(0, { name = name, link = false })
  end

  local function set_inlay_highlights()
    local normal = hl 'Normal'
    local comment = hl 'Comment'
    local type = hl 'Type'
    local identifier = hl 'Identifier'
    local cursorline = hl 'CursorLine'
    local visual = hl 'Visual'

    local pill_bg = cursorline.bg or visual.bg or normal.bg

    vim.api.nvim_set_hl(0, 'LspInlayHint', {
      fg = comment.fg or normal.fg,
      bg = pill_bg,
    })

    vim.api.nvim_set_hl(0, 'LspInlayHintType', {
      fg = type.fg or comment.fg or normal.fg,
      bg = pill_bg,
    })

    vim.api.nvim_set_hl(0, 'LspInlayHintParameter', {
      fg = identifier.fg or comment.fg or normal.fg,
      bg = pill_bg,
    })

    -- caps take the pill's bg as their fg so they blend into the editor bg
    -- and form the rounded edge of the pill
    vim.api.nvim_set_hl(0, 'LspInlayHintPillCap', {
      fg = pill_bg,
      bg = normal.bg,
    })
  end

  set_inlay_highlights()

  -- base46 (NvChad theme loader) paints highlights via raw nvim_set_hl calls
  -- during startup, not :colorscheme, so it never fires 'ColorScheme' and our
  -- first pass above can capture stale colors. Recompute once more after
  -- startup settles.
  vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
      vim.schedule(set_inlay_highlights)
    end,
  })

  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = set_inlay_highlights,
  })

  -- bake an icon + inner padding into the label; the pill caps are added at
  -- render time below, since they need their own highlight group
  local original_handler = vim.lsp.handlers['textDocument/inlayHint']

  vim.lsp.handlers['textDocument/inlayHint'] = function(err, result, ctx, config)
    if not result then
      return original_handler(err, result, ctx, config)
    end

    for _, hint in ipairs(result) do
      local label = hint.label
      local prefix = ' '

      if hint.kind == 1 then
        prefix = ' 󰜁 '
      elseif hint.kind == 2 then
        prefix = ' 󰏪 '
      end

      if type(label) == 'string' then
        if not label:match('^' .. vim.pesc(prefix)) then
          hint.label = prefix .. label .. ' '
        end
      elseif type(label) == 'table' then
        if label[1] and label[1].value and not label[1].value:match('^' .. vim.pesc(prefix)) then
          label[1].value = prefix .. label[1].value .. ' '
        end
      end
    end

    return original_handler(err, result, ctx, config)
  end

  -- force vim.lsp.inlay_hint to load now, so its own decoration provider
  -- registers on the 'nvim.lsp.inlayhint' namespace before we steal it below
  local core_inlay_hint = vim.lsp.inlay_hint

  local function hint_text(label)
    if type(label) == 'string' then
      return label
    end
    local text = ''
    for _, part in ipairs(label) do
      text = text .. part.value
    end
    return text
  end

  local function hint_hl_group(kind)
    if kind == 1 then
      return 'LspInlayHintType'
    elseif kind == 2 then
      return 'LspInlayHintParameter'
    end
    return 'LspInlayHint'
  end

  -- core (vim/lsp/inlay_hint.lua) draws every hint with a single flat
  -- highlight group, so there's no way to color a pill's edges differently
  -- from its body through the public API. Steal its decoration provider and
  -- redraw ourselves, reusing core's own cache via inlay_hint.get().
  local pill_ns = vim.api.nvim_create_namespace 'nvim.lsp.inlayhint'

  vim.api.nvim_set_decoration_provider(pill_ns, {
    on_win = function(_, _, bufnr, topline, botline)
      vim.api.nvim_buf_clear_namespace(bufnr, pill_ns, topline, botline + 1)

      if not core_inlay_hint.is_enabled { bufnr = bufnr } then
        return
      end

      local hints = core_inlay_hint.get {
        bufnr = bufnr,
        range = {
          start = { line = topline, character = 0 },
          ['end'] = { line = botline, character = 0 },
        },
      }

      for _, item in ipairs(hints) do
        local hint = item.inlay_hint
        local hl_group = hint_hl_group(hint.kind)
        local line_content = (vim.api.nvim_buf_get_lines(bufnr, hint.position.line, hint.position.line + 1, false) or { '' })[1]
        local clamped_col = math.min(hint.position.character, #line_content)

        vim.api.nvim_buf_set_extmark(bufnr, pill_ns, hint.position.line, clamped_col, {
          virt_text_pos = 'inline',
          virt_text = {
            { LEFT_CAP, 'LspInlayHintPillCap' },
            { hint_text(hint.label), hl_group },
            { RIGHT_CAP, 'LspInlayHintPillCap' },
          },
        })
      end
    end,
  })

  vim.keymap.set('n', '<leader>ih', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = 'Toggle Inlay Hints globally' })
end

setup_inlay_hints()
