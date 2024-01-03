-- Map("", "L", Move_to_bottom_screen)
-- Map("", "H", Move_to_top_screen)
-- Map("", "<Space>", Trim__save__no_highlight)
-- Map("", "U", Trim__save__format)

Map("n", "gD", Reveal_definition_aside)
Map("n", "gt", Go_to_implementation)
Map("n", "gq", Go_to_reference)
Map("n", ",r", Rename_symbol)
Map("n", "<<", Outdent)
Map("n", ">>", Indent)
Map("n", "gcc", Comment)
Map("n", "=s", Convert_to_spaces)
Map("n", "=t", Convert_to_tabs)
Map("n", "=d", Indent_with_spaces)
Map("n", "=g", Indent_with_tabs)
Map("n", "K", CloseEditor)
Map("n", ",K", UndoCloseEditor)
-- Map("n", "zk", Git_stage_file)
-- Map("n", "zK", Git_unstage_file)
-- Map("n", "zi", Git_open_changes)
-- Map("n", "zI", Git_open_all_changes)
-- Map("n", "zy", Toggle_breakpoint)
Map("n", "yr", Copy_relative_path)
Map("n", "yR", Copy_path)

-- Map("v", "gs", Codesnap)
Map("v", "<", Outdent_vis)
Map("v", ">", Indent_vis)
Map("v", "gc", Comment_vis)

-- Map({ "n", "v" }, "zJ", Git_revert_change)
-- Map({ "n", "v" }, "zj", Git_stage_change)
-- Map({ "n", "v" }, "zt", Vscode_ctrl_d)
-- Map({ "n", "v" }, "zb", Vscode_ctrl_u)

-- local move_to_bottom_screen__center_screen = 'Lzz'
-- Map("", "L", move_to_bottom_screen__center_screen)

-- local move_to_top_screen__center_screen = 'Hzz'
-- Map("", "H", move_to_top_screen__center_screen)

-- leap for motions
Map({ "n", "x", "o" }, "q", "<Plug>(leap-forward-to)")
Map({ "n", "x", "o" }, "Q", "<Plug>(leap-backward-to)")
Map({ "x", "o" }, "x", "<Plug>(leap-forward-till)")
Map({ "x", "o" }, "X", "<Plug>(leap-backward-till)")

-- easyalign
Map("", "ga", "<Plug>(EasyAlign)")
