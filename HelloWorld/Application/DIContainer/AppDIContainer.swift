import Foundation

final class AppDIContainer {
    
    func makeStartUpSceneDIContainer() -> StartUpSceneDIContainer{
        
        let dependencies = StartUpSceneDIContainer.Dependencies(apiService: "Something")
        
        return StartUpSceneDIContainer(dependencies: dependencies)
    }
    
}
