import Foundation
import SwiftyJSON

class EventoModel{
    var name:String
    var fecha: String?
    var hora: String?
    var img: String?
    
    init(object:JSON){
        name = object["nombre"].stringValue
        fecha = object["fecha"].stringValue
        hora = object["hora"].stringValue
        img = object["img"].stringValue
    }
}
