@wrapMethod(UIInventoryItem)
public func GetWeight() -> Float {
    let result = wrappedMethod();
    return MeasurementUtils.ValueToPlayerSettingSystem(result, EMeasurementUnit.Pound);
}
