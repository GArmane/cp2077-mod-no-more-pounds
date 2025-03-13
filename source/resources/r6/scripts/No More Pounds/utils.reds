module NoMorePounds.Utils

public func HorsepowerToKilowatts(hp: Float) -> Float {
    // Conversion factor: 1 HP = 0.7457 kW
    return hp * 0.7457;
}
