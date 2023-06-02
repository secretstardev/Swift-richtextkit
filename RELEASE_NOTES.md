# Release Notes

RichTextKit will use semver after 1.0. 

Until then, deprecated features may be removed in the next minor version.



## 0.6

### ✨ Features

* `Image` has new `richTextIndentDecrease` and `richTextIndentIncrease` actions.
* `NSTextAttachment` has a new `attachedImage` property.
* `RichTextAction` has new `increaseIndent` and `decreaseIndent` actions.
* `RichTextActionButtonGroup` is a new view that groups multiple action buttons together.
* `RichTextAttributeWriter` now supports affecting the entire text by default.
* `RichTextButtonGroup` is a new view that groups multiple buttons together.
* `RichTextColorWriter` now supports affecting the entire text by default.
* `RichTextContext` has new `canDecreaseIndent` and `canIncreaseIndent` properties.
* `RichTextContext` has new `decreaseIndent()` and `increaseIndent()` functions.
* `RichTextContext` has new `resetAttributedString()` and `setAttributedString()` functions.
* `RichTextFontWriter` now supports affecting the entire text by default.
* `RichTextFormatSheet` now groups related buttons and also adds indent buttons.
* `RichTextIndent` is a new enum for handling text indent changes.
* `RichTextIndentPicker` is a new enum for picking a text indent.
* `RichTextIndentReader` is a new type for managing text indents.
* `RichTextIndentWriter` is a new type for managing text indents.
* `RichTextKeyboardToolbar` now supports modofying the format sheet before presenting it.
* `RichTextStyleToggleGroup` is a new view that groups multiple toggles together.
* `RichTextStyleWriter` now supports affecting the entire text by default.

### 💡 Adjustments
        
* Thanks to [@willmorris44](https://github.com/willmorris44) and [@diniska](https://github.com/diniska), the UIKit and AppKit `RichTextView`s now update whenever the text changes.
* Thanks to [@msrutek-paylocity](https://github.com/msrutek-paylocity), some typos are fixed and some tests cleaned up. 

### 🐛 Bug Fixes
        
* This version fixes a bug where setting up an editor with a text that had image attachments, didn't resize the images until the user typed in the text editor.  

### 💥 Breaking Changes
                
* `RichTextKeyboardToolbar` `height` and `spacing` has been moved to `RichTextKeyboardToolbarStyle`.



## 0.5.2

### 🐛 Bug Fixes
        
* Initial text color is only applied when setting up rich text with an empty string.  



## 0.5

### 💥 Breaking Changes
        
* All deprecated types have been removed.



## 0.4

This release addresses some performance changes, by trying to minimize the number of redraws.

As a result, the `RichTextContext`'s `selectedRange` is no longer observable, since that caused every input or text position change to redraw the entire app. The library and demo app however still updates way to often, and too much. For instance, switching between having a selected range and not should only redraw the copy button, but now updates the entire screen. If you know how to minimize this, please reach out.

Furthermore, this release adds support for focus values and menu commands. You can see them in action in the demo app.  

### ✨ New Features

* `Commands` is a new namespace for app commands.
* `Focus` is a new namespace for focus values.
* `RichTextDataFormat` has a new `fileFormatText` property.
* `RichTextDataFormat` has a new `isArchivedDataFormat` property.
* `RichTextDataFormat` has a new `libraryFormats` property that returns all formats except the `vendorArchivedData` format.
* `RichTextDataFormatMenu` is a new menu that triggers an action for various formats.
* `RichTextDataReader` now has ways to get data for the current rich text.
* `RichTextExportMenu` is a new menu for exporting rich text.
* `RichTextContextFocusedValueKey` is a new rich text context focus key.
* `RichTextFormatCommandMenu` is a new command menu for adding rich text formatting to the system menu. 
* `RichTextNSSharingMenu` is a new macOS-specific menu for sharing rich text with `NSSharingServices`.
* `RichTextShareCommandMenu` is a new command menu for adding rich text sharing and exporting to the system menu.
* `RichTextShareMenu` is a new menu for sharing rich text.
* `ViewDebug` is a new demo app class that is used for view debugging capabilities.
* The library is now localized in Danish, German and Norwegian, although some translations probably need adjusting. 

### 💡 Behavior changes

* `RichTextCoordinator` now checks if properties have changed before it syncs.

### 🐛 Bug Fixes

* `RichTextKeyboardToolbar` no longer allocates width for hidden items.
* `RichTextStyleToggle` is no longer tinted by default when inactive.

### 🗑️ Deprecated

* `PdfDataReader` has been renamed to `RichTextPdfDataReader`.
* `RichTextDataWriter` is deprecated.
* `RichTextDataWriter` functionality has been moved to `RichTextDataReader`.

### 💥 Breaking Changes
        
* `RichTextContext` no longer has a font size in the initializer, use `StandardFontSizeProvider` (CGFloat, TextEditor etc.) instead.
* `RichTextContext` `selectedRange` is no longer published.
* `RichTextDataReader` now implements `RichTextReader`.
* `RichTextDataReader` format-specific data functions have been made private.
* `RichTextStyleToggle.Style` `inactiveColor` is now optional.
* `NSMutableString` format-specific initializers have been made private.



## 0.3

This release adds support for strikethrough and cleans up some 0.2 code. It also adds a bunch of new views, such as toolbars, sidebars, sheets etc., as well as support for keyboard shortcuts, localization and accessibility.

### ✨ New Features

* `Bundle.richTextKit` is a new bundle extension that works in external previews.
* `RichTextAction` has a new `dismissKeyboard` action.
* `RichTextAction` has new `incrementFontSize` and `decrementFontSize` actions.
* `RichTextAction` has new `undo` and `redo` name aliases.
* `RichTextActionButton` has a new `fillVertically` parameter.
* `RichTextFormatSheet` is a new view that collects a bunch of text formatting controls.
* `RichTextFormatSidebar` is a new view that collects a bunch of text formatting controls.
* `RichTextKeyboardToolbar` is a new toolbar that can be used on iOS.
* `RichTextKeyboardToolbarMenu` is a new toolbar menu.
* `RichTextStyle` has a new `strikethrough` style.
* `RichTextStyleToggle` has a new `fillVertically` parameter.
* `RTKL10n` is a new enum with localized strings, which is used to localize multiple types.
* `View+KeyboardShortcuts` is a new view extension to simplify binding keyboard shortcuts to views.
* The various stack views now support 

### 💡 Behavior changes

* `RichTextActionButtonStack` and `RichTextStyleToggleStack` now fills vertically.
* `RichTextStyleButton` and `RichTextStyleToggle` now applies keyboard shortcuts.
* `RichTextStyleToggle` applies a toggle-like style to fallbacks on older OS versions.
* Many pickers, buttons and toggles apply a localized accessibility label.
* More buttons apply a rectangular content shape.

### 💥 Breaking Changes
    
* `RichTextActionButtonStack` no longer has default actions.
* `RichTextActionButtonStack` no longer has a bordered init parameter.
* `RichTextAlignmentPicker` no longer has title and segmented parameters.
* `RichTextFontSizePickerStack` no longer has a bordered init parameter.
* `RichTextFontSizePickerStack` now requires a `RichTextContext` instea dof a binding.



## 0.2

### ✨ New Features

* `Image` has new rich text-specific images.
* `NSImage` `cgImage` and `jpegData` are now public.
* `NSAttributedString` has a new `withBlackText()` extension.
* `NSAttributedString` has a new init extension file.
* `RichTextAction` is a new enum that defines rich text actions.
* `RichTextActionButton` is a new view that can trigger a RichTextAction.
* `RichTextActionButtonStack` is a new view that can list multiple RichTextActionButton views.
* `RichTextContext` has new bindings.
* `RichTextCoordinator` now subscribes to highlighting style changes.
* `RichTextCoordinator` `cancellables` are now public.
* `RichTextCoordinator` `resetHighlightedRangeAppearance()` is now public.
* `RichTextCoordinator` `text` is now mutable.
* `RichTextColorPicker` is a new color picker.
* `RichTextColorPickerStack` is a new view that can list multiple RichTextColorPicker views.
* `RichTextDataFormat` has a new vendor-specific data format.
* `RichTextFontSizePickerStack` is a new view that can list multiple RichTextFontSizePicker views.
* `RichTextImageAttachment` is now open for inheritance.
* `RichTextStyleButton` has a new button style.
* `RichTextStyleToggle` is a new style toggle button.
* `RichTextStyleToggleStack` is a new view that can list multiple RichTextStyleToggle views.
* `RichTextView` is now open for inheritance.
* `RichTextView` drop interaction functionality is now open. 
* `String` extensions have been made public.

### 💡 Behavior changes

* `RichTextAlignmentPicker` is now segmented by default.

### 🗑️ Deprecated

* `Font` picker components have been renamed with a `RichText` prefix.
* `FontSizePicker` `sizes` has been renamed to `values`.
* `PdfDataWriter` has been renamed to `PdfDataReader`.
* `RichTextAlignmentPicker` `alignments` has been renamed to `values`.
* `RichTextContext` `alignment` has been renamed to `textAlignment`.
* `RichTextContext` `standardHighlightingStyle` has been renamed to `highlightingStyle`.
* `RichTextCoordinator` `context` has been renamed to `richTextContext`.
* `RichTextDataWriter` `richTextData(with:)` has been renamed to `richTextData(for:)`.
* `RichTextViewRepresentable` has been renamed to `RichTextViewComponent`.

### 💥 Breaking Changes
  
* `RichTextView` alert function `title` parameter is no longer implicit.
* `RichTextViewRepresentable` `decrementFontSize` has been renamed to `decrementCurrentFontSize` and has no range parameter.
* `RichTextViewRepresentable` `incrementFontSize` has been renamed to `incrementCurrentFontSize` and has no range parameter.  



## 0.1.2

This is a small bugfix release.

### 🐛 Bugs

* `RichTextCoordinator` now subscribes to image pasting.



## 0.1.1

This is a small bugfix release.

### 🐛 Bugs

* `RichTextAlignmentWriter` now uses safe ranges to avoid occasional crashes.



## 0.1

This is the first beta release of RichTextKit.

The release includes the following.

### ✨ Foundational Types

* `RichTextView` is a replacement for `UITextView` and `NSTextView`.
* `RichTextEditor` is a SwiftUI view that embeds a `RichTextView`.
* `RichTextContext` is used to inspect and interact with a `RichTextEditor`.
* `RichTextCoordinator` is used by a `RichTextEditor` to keep the text view and context in sync.  

### ✨ Feature support

RichTextKit adds extensive support for a bunch of rich text features:

* Alignment
* Attributes
* Colors
* Data
* Export
* Fonts
* Images
* Pasteboard extensions
* Pdf
* Sharing
* Styles
* Views
