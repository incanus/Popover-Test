Here's the nut of it. The popoverArrowDirection docs say:

The default value of this property is UIPopoverArrowDirectionUnknown. 
When you present the popover, the value changes to reflect the actual 
direction of the arrow being used by the popover. When the popover is 
subsequently dismissed, the value of this property returns to 
UIPopoverArrowDirectionUnknown.

However, in my testing, on iOS 5, the arrow direction is always unknown
after presentation (i.e., -1).

What am I doing wrong here? 