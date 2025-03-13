native func Log(const text: script_ref<String>) -> Void
native func LogWarning(const text: script_ref<String>) -> Void
native func LogError(const text: script_ref<String>) -> Void

// output goes to CET window
native func LogChannel(channel: CName, const text: script_ref<String>)
native func LogChannelWarning(channel: CName, const text: script_ref<String>) -> Void
native func LogChannelError(channel: CName, const text: script_ref<String>) -> Void

native func FTLog(const value: script_ref<String>) -> Void
native func FTLogWarning(const value: script_ref<String>) -> Void
native func FTLogError(const value: script_ref<String>) -> Void

native func Trace() -> Void
native func TraceToString() -> String


public static func LogWidgetTree(channel: CName, widget: wref<inkCompoundWidget>, opt props: Bool, opt indent: String) {
    let i = 0;

    if StrLen(indent) == 0 {
      LogChannel(channel, s"\(widget.GetName()) - \(widget.GetClassName())");
    }
    while i < widget.GetNumChildren() {
      let child: wref<inkWidget> = widget.GetWidget(i);
      let compChild = child as inkCompoundWidget;

      LogChannel(channel, s"\(indent)|-- \(child.GetName()) - \(child.GetClassName())");
      if props {
        let anchor = child.GetAnchor();
        let size = child.GetSize();
        let scale = child.GetScale();

        LogChannel(channel, s"\(indent){");
        LogChannel(channel, s"\(indent)  anchor: inkEAnchor.\(anchor)");
        LogChannel(channel, s"\(indent)  size: (\(size.X), \(size.Y))");
        LogChannel(channel, s"\(indent)  scale: (\(scale.X), \(scale.Y))");
        let wText = child as inkText;

        if IsDefined(wText) {
          LogChannel(channel, s"\(indent)  text: \"\(wText.GetText())\"");
          LogChannel(channel, s"\(indent)  fontSize: \"\(wText.GetFontSize())\"");
        }
        LogChannel(channel, s"\(indent)}");
      }
      i += 1;
    }
}
