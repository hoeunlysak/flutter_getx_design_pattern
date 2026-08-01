# flutter_getx_design_pattern

A new Flutter project.

## Getting Started

-Design Pattern Default:
 - MVC -> Model / View / Controller
 - MVP -> Model / View / Presenter
 - MVVM -> Model / View / View / Model
- Apply Getx
  - State Manager -> State Management
  - Navigation Manage -> Route
    - Get.toNamed("/splash")
    - Get.toRemove("/login")
  - Dependency Manager -> Service/ServiceImpl -> Create Object
    - ProductService _productService = new ProductService();
      - var productService = Get.find(ProductService())
- Bloc
- LivePro