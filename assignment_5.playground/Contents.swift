


// problem 1
print(" --- problem1 ----")

protocol SomeProtocol  {
    var property1: Int { get }
    var property2: String { get }
    var property3: (() -> Int)? { get }
    static var property4: String? { get set }
    
    static func method1(arg param: Int)
    func method2(arg param: Int) -> Int?
    mutating func method3() -> String?
}

// class ( classes have to have initilizer. how do we implement these properties as just only get?? )
class Class1: SomeProtocol {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    
    init(property1: Int, property2: String, property3: (() -> Int)?) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
    
    static func method1(arg param: Int) {
        print(param)
    }
    func method2(arg param: Int) -> Int? {
        return param > 4 ? param : nil
    }
    func method3() -> String? {
        self.property2 = "hello"
        return Int.random(in: 1...10) > 4 ? self.property2 : nil
    }
}

// sructure
struct Struct1: SomeProtocol {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    
    static func method1(arg param: Int) {
        print(param)
    }
    func method2(arg param: Int) -> Int? {
        return param > 4 ? param : nil
    }
    mutating func method3() -> String? {
        self.property2 = "hello"
        return Int.random(in: 1...10) > 4 ? self.property2 : nil
    }
}

// enum conforms to SomeProtocol
enum SomeEnum {
    case property1(Int)
    case property2(String)
    case property3((() -> Int)?)
    case property4(String?)
    
    case method1(Int)
    case method2(Int)
    case method3
}

// helper function
func evaluate(argument parameter: SomeEnum) -> Any? {
    switch parameter {
    case let .property1(value1):
        return value1
    case let .property2(value2):
        return value2
    case let .property3(value3):
        return value3
    case let .property4(value4):
        return value4
        
    case let .method1(params1):
        print(params1)
        return nil
    case let .method2(params2):
        return params2 > 4 ? params2 : nil
    case .method3:
        return Int.random(in: 1...10) > 4 ? "hello" : nil
    }
}

// problem2 and 3
print("--- problem2 and 3 ---")

// ServiceProvider
class ServiceProvider {
    init(){}
}

// CarRepairServiceProvider
class CarRepairServiceProvider:ServiceProvider {
    
    var Description: String
    var Carmodel: String
    
    init(description: String, carmodel: String) {
        self.Description = description
        self.Carmodel = carmodel
    }
}

enum HomeService: String {
    case CookingService = "we are cooking instead of you."
    case WashingService  = "we are cleaning instead of you"
    case BabySittingService = "we take care of your bady instead of you."
}

// HomeServiceProvider
class HomeServiceProvider:ServiceProvider{
    var serviceType: HomeService
    var address: String
    
    init(servicetype: HomeService, address: String) {
        self.serviceType = servicetype
        self.address = address
    }
}

// StudentServiceProvider
class StudentServiceProvider: ServiceProvider {
    var descriptionOfStudent: String
    
    init(descriptionofstudent: String) {
        self.descriptionOfStudent = descriptionofstudent
    }
}

// client A
class ClientA: CarRepairServiceProvider {
    init() {
        super.init(description: "car repair service description", carmodel: "some car")
    }
}

// client B
class ClientB: HomeServiceProvider {
    init() {
        super.init(servicetype: HomeService.CookingService, address: "Some-Street")
    }
}

// client C
class ClientC: StudentServiceProvider {
    init() {
        super.init(descriptionofstudent: "student A is good.")
    }
}



// --- problem 3 ---
print("--- problem3 ---")
// made change above ...


// --- problem 4 ---
print("--- problem 4 ---")

// A Student class
class Student {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
// viewTable class list 10 students in the table that can fix "row" and "height"
class ViewTable {
    var students: [Student]
    var row: Int
    var heightOfRow: Int
    
    init(students: [Student], row: Int, heightOfRow: Int) {
        self.students = students
        self.row = row
        self.heightOfRow = heightOfRow
    }
}

// problem 5
print("--- problem 5 ---")
protocol SpecialStringProtocol {
    
    // it checks whether a given condition is met on the current string
    func veriableStringForACondition(_ conditionRedicate: (String) -> Bool) -> Bool
    
    // it checks whether the string is a double repeated string, For instace abab is a double repeated because the ab is repeated 2 times.
    func repeatedString() -> Bool
}

extension String: SpecialStringProtocol {
    func veriableStringForACondition(_ conditionRedicate: (String) -> Bool) -> Bool {
        if conditionRedicate(self) {
            return true
        }
        return false
    }
    
    func repeatedString() -> Bool {
        if self.count < 2 { return false }
        for iThValue in self {
            var count = 0
            for jThValue in self {
                if iThValue == jThValue {
                    count += 1
                    if count > 1 {
                        return true
                    }
                }
            }
        }
        return false
    }
}

let string1 = "haruki"
print(string1.repeatedString())
let string2 = "kuri-sun"
print(string2.repeatedString())
let string3 = "kuriwada"
print(string3.repeatedString())


// --- problem 6 ---
print("--- problem 6 ---")

protocol Protocol1_6 {
    var property1: Int? { get }
}

protocol Protocol2_6 {
    var property2: String { get }
}

protocol Protocol3_6 {
//    TODO: How can I achieve this ??
//    var property3: (Int?) -> String { get }
    var property3: String { get }
}

class ManyClass: Protocol1_6, Protocol2_6, Protocol3_6 {
    var property1: Int?
    var property2: String
    var property3: String
//    TODO: How can I achieve this ??
//    var property3: (Int?) -> String
    
    init(property1: Int?, property2: String, property3: String) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
}

var instance:ManyClass = ManyClass(property1: 12, property2: "haruki", property3: "kuri-sun")
let list1: [ManyClass] = [instance]
print(list1)

// protocol composition
struct Dependency: Protocol1_6, Protocol2_6, Protocol3_6 {
    var property1: Int? = 0
    var property2: String = "hello"
    var property3: String = "kuri-sun"
}
let instance2 = Dependency()

// create dictionary
let dictionary: [String: Dependency] = ["protocol1" : instance2 , "protocol2" : instance2, "protocol3" : instance2]


