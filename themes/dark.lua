-- Copyright 2007-2020 Mitchell mitchell.att.foicica.com. See LICENSE.
-- Dark theme for Textadept.
-- Contributions by Ana Balan.

local buffer, view = buffer, view
local property, property_int = buffer.property, buffer.property_int

-- Greyscale colors.
property['color.dark_black'] = 0x000000
property['color.black'] = 0x1A1A1A
property['color.light_black'] = 0x333333
property['color.grey_black'] = 0x4D4D4D
property['color.dark_grey'] = 0x666666
property['color.grey'] = 0x808080
property['color.light_grey'] = 0x999999
property['color.grey_white'] = 0xB3B3B3
property['color.dark_white'] = 0xCCCCCC
property['color.white'] = 0xE6E6E6
property['color.light_white'] = 0xFFFFFF

-- Dark colors.
property['color.dark_red'] = 0x1A1A66
property['color.dark_yellow'] = 0x1A6666
property['color.dark_green'] = 0x1A661A
property['color.dark_teal'] = 0x66661A
property['color.dark_purple'] = 0x661A66
property['color.dark_orange'] = 0x1A66B3
property['color.dark_pink'] = 0x6666B3
property['color.dark_lavender'] = 0xB36666
property['color.dark_blue'] = 0xB3661A

-- Normal colors.
property['color.red'] = 0x4D4D99
property['color.yellow'] = 0x4D9999
property['color.green'] = 0x4D994D
property['color.teal'] = 0x99994D
property['color.purple'] = 0x994D99
property['color.orange'] = 0x4D99E6
property['color.pink'] = 0x9999E6
property['color.lavender'] = 0xE69999
property['color.blue'] = 0xE6994D

-- Light colors.
property['color.light_red'] = 0x8080CC
property['color.light_yellow'] = 0x80CCCC
property['color.light_green'] = 0x80CC80
property['color.light_teal'] = 0xCCCC80
property['color.light_purple'] = 0xCC80CC
property['color.light_orange'] = 0x80CCFF
property['color.light_pink'] = 0xCCCCFF
property['color.light_lavender'] = 0xFFCCCC
property['color.light_blue'] = 0xFFCC80

-- Default font.
property['font'], property['fontsize'] = 'Bitstream Vera Sans Mono', 10
if WIN32 then
  property['font'] = 'Courier New'
elseif OSX then
  property['font'], property['fontsize'] = 'Monaco', 12
end

-- Predefined styles.
property['style.default'] = 'font:$(font),size:$(fontsize),'..
                            'fore:$(color.light_grey),back:$(color.black)'
property['style.linenumber'] = 'fore:$(color.dark_grey),back:$(color.black)'
--property['style.controlchar'] =
property['style.indentguide'] = 'fore:$(color.light_black)'
property['style.calltip'] = 'fore:$(color.light_grey),back:$(color.light_black)'
property['style.folddisplaytext'] = 'fore:$(color.dark_grey)'

-- Token styles.
property['style.class'] = 'fore:$(color.light_yellow)'
property['style.comment'] = 'fore:$(color.dark_grey)'
property['style.constant'] = 'fore:$(color.red)'
property['style.embedded'] = '$(style.keyword),back:$(color.light_black)'
property['style.error'] = 'fore:$(color.red),italics'
property['style.function'] = 'fore:$(color.blue)'
property['style.identifier'] = ''
property['style.keyword'] = 'fore:$(color.dark_white)'
property['style.label'] = 'fore:$(color.orange)'
property['style.number'] = 'fore:$(color.teal)'
property['style.operator'] = 'fore:$(color.yellow)'
property['style.preprocessor'] = 'fore:$(color.purple)'
property['style.regex'] = 'fore:$(color.light_green)'
property['style.string'] = 'fore:$(color.green)'
property['style.type'] = 'fore:$(color.lavender)'
property['style.variable'] = 'fore:$(color.light_blue)'
property['style.whitespace'] = ''

-- Multiple Selection and Virtual Space
--view.additional_sel_alpha =
--view.additional_sel_fore =
--view.additional_sel_back =
--view.additional_caret_fore =

-- Caret and Selection Styles.
view:set_sel_fore(true, property_int['color.light_black'])
view:set_sel_back(true, property_int['color.grey'])
--view.sel_alpha =
view.caret_fore = property_int['color.grey']
view.caret_line_back = property_int['color.light_black']
--view.caret_line_back_alpha =

-- Fold Margin.
view:set_fold_margin_colour(true, property_int['color.black'])
view:set_fold_margin_hi_colour(true, property_int['color.black'])

-- Markers.
local MARK_BOOKMARK = textadept.bookmarks.MARK_BOOKMARK
--view.marker_fore[MARK_BOOKMARK] = property_int['color.black']
view.marker_back[MARK_BOOKMARK] = property_int['color.dark_blue']
--view.marker_fore[textadept.run.MARK_WARNING] = property_int['color.black']
view.marker_back[textadept.run.MARK_WARNING] = property_int['color.yellow']
--view.marker_fore[textadept.run.MARK_ERROR] = property_int['color.black']
view.marker_back[textadept.run.MARK_ERROR] = property_int['color.red']
for i = buffer.MARKNUM_FOLDEREND, buffer.MARKNUM_FOLDEROPEN do -- fold margin
  view.marker_fore[i] = property_int['color.black']
  view.marker_back[i] = property_int['color.dark_grey']
  view.marker_back_selected[i] = property_int['color.light_grey']
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND] = property_int['color.dark_yellow']
view.indic_alpha[ui.find.INDIC_FIND] = 255
local INDIC_BRACEMATCH = textadept.editing.INDIC_BRACEMATCH
view.indic_fore[INDIC_BRACEMATCH] = property_int['color.light_grey']
local INDIC_HIGHLIGHT = textadept.editing.INDIC_HIGHLIGHT
view.indic_fore[INDIC_HIGHLIGHT] = property_int['color.orange']
view.indic_alpha[INDIC_HIGHLIGHT] = 255
local INDIC_PLACEHOLDER = textadept.snippets.INDIC_PLACEHOLDER
view.indic_fore[INDIC_PLACEHOLDER] = property_int['color.grey']

-- Call tips.
view.call_tip_fore_hlt = property_int['color.light_blue']

-- Long Lines.
view.edge_colour = property_int['color.dark_grey']
