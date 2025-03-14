// Vehicle scanner tooltip.
module NoMorePounds.ScannerVehiclePower

public func HorsepowerToKilowatts(hp: Float) -> Float {
    // Conversion factor: 1 HP = 0.7457 kW
    return hp * 0.7457;
}

@wrapMethod(VehicleObject)
public final func CompileScannerChunks() -> Bool {
    if wrappedMethod() {
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
