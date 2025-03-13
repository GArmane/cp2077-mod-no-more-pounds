// Vehicle scanner tooltip.
module NoMorePounds.ScannerVehicle

import NoMorePounds.Utils.{ HorsepowerToKilowatts }

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

        // Horsepower conversion
        if this == (this as CarObject) || this == (this as BikeObject) {
            // Convert HP to kW
            let vehicle_horsepower = this.GetRecord()
                .VehicleUIData()
                .Horsepower();
            let horsepowerChunk = new ScannerVehicleHorsepower();
			horsepowerChunk.Set(RoundMath(HorsepowerToKilowatts(HorsepowerToKilowatts(vehicle_horsepower))));

            // Update power.
            let scannerBlackboard: wref<IBlackboard> = GameInstance
                .GetBlackboardSystem(this.GetGame())
                .Get(GetAllBlackboardDefs().UI_ScannerModules);
			scannerBlackboard.SetVariant(
                GetAllBlackboardDefs().UI_ScannerModules.ScannerVehicleHorsepower,
                horsepowerChunk
            );
        }
        return true;
    }
    return false;
}
