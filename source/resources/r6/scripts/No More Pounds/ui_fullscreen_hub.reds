// Fullscreen HUB menu, when you press Pause
module NoMorePounds.UIFullscreenHub

@wrapMethod(SubMenuPanelLogicController)
public final func HandlePlayerMaxWeightUpdated( value : Int32, curInventoryWeight : Float ) {
    let value = Cast<Int32>(MeasurementUtils.ValueToPlayerSettingSystem(Cast<Float>(value), EMeasurementUnit.Pound));
    let curInventoryWeight = MeasurementUtils.ValueToPlayerSettingSystem(curInventoryWeight,EMeasurementUnit.Pound);

    wrappedMethod(value, curInventoryWeight);
}

@wrapMethod(SubMenuPanelLogicController)
public final func HandlePlayerWeightUpdated( value : Float, maxWeight : Int32 ) {
    let value = MeasurementUtils.ValueToPlayerSettingSystem(value, EMeasurementUnit.Pound);
    let maxWeight = Cast<Int32>(MeasurementUtils.ValueToPlayerSettingSystem(Cast<Float>(maxWeight), EMeasurementUnit.Pound));

    wrappedMethod(value, maxWeight);
}
