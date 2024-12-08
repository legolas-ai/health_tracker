//
//  CoreMotionManager.swift
//  health_tracker
//
//  Created by Daanish Faiz on 8/12/2024.
//
import CoreMotion

class CoreMotionManager {
    static let shared = CoreMotionManager()
    private let pedometer = CMPedometer()
    
    private init() {}
    
    func fetchPedometerData() {
        guard CMPedometer.isStepCountingAvailable() else {
            print("Pedometer is not available.")
            return
        }
        
        pedometer.startUpdates(from: Date()) { data, error in
            if let error = error {
                print("Error fetching pedometer data: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                print("Steps: \(data.numberOfSteps)")
            }
        }
    }
}

