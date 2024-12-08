//
//  HealthKitManager.swift
//  health_tracker
//
//  Created by Daanish Faiz on 8/12/2024.
//
import HealthKit

class HealthKitManager {
    static let shared = HealthKitManager() // Singleton for simplicity
    private let healthStore = HKHealthStore()
    
    private init() {} // Prevent external instantiation
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, nil)
            return
        }
        
        let readTypes: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes, completion: completion)
    }
    
    func fetchStepCountData() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: stepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, samples, error in
            if let error = error {
                print("Error fetching step count data: \(error.localizedDescription)")
                return
            }
            
            guard let quantitySamples = samples as? [HKQuantitySample] else { return }
            
            for sample in quantitySamples {
                print("Step count: \(sample.quantity.doubleValue(for: HKUnit.count())) at \(sample.startDate)")
            }
        }
        
        healthStore.execute(query)
    }
}

