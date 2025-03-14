// Vehicle scanner tooltip.
module NoMorePounds.ScannerVehicleWeight

@wrapMethod(VehicleObject)
public final func CompileScannerChunks() -> Bool {
    if wrappedMethod() {
        // Weight conversion.
        let massChunk: ref<ScannerVehicleMass>;
		let uiData: ref<VehicleUIData_Record>;
		uiData = this.GetRecord().VehicleUIData();
        massChunk = new ScannerVehicleMass();
        massChunk.Set(RoundMath(uiData.Mass()));

        // Update weight text.
        let scannerBlackboard: ref<IBlackboard>;
        scannerBlackboard = GameInstance.GetBlackboardSystem(GetGameInstance()).Get(GetAllBlackboardDefs().UI_ScannerModules);
        scannerBlackboard.SetInt(GetAllBlackboardDefs().UI_ScannerModules.ObjectType, EnumInt(ScannerObjectType.VEHICLE), true);
        scannerBlackboard.SetVariant(GetAllBlackboardDefs().UI_ScannerModules.ScannerVehicleMass, massChunk);

        return true;
    }
    return false;
}
