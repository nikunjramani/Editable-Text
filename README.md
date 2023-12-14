## Getting started

An "editable text view where the user can edit text by double-tapping on the text" is typically a user interface component that combines the characteristics of a TextView and an EditText

```code
            EditableTextWidget(
                initialText: "text",
                onTextChangedSubmitted: (newText) {
                 print(newText)
                })
```
