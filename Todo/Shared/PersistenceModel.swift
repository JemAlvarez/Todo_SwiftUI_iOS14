//

import CoreData

struct PersistenceModel {
    static let shared = PersistenceModel()
    
    let container: NSPersistentContainer
    
    // init
    init() {
        container = NSPersistentContainer(name: "TodoDataModel")
        
        container.loadPersistentStores { storeDesc, err in
            if let err = err as NSError? {
                print("Unresolved: \(err)")
            }
        }
    }
    
    // save data
    func onSaveContext() {
        do {
            try PersistenceModel.shared.container.viewContext.save()
        } catch {
            print("Error: \(error)")
        }
    }
}
