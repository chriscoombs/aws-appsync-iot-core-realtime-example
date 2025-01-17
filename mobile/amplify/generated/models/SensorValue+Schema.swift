// swiftlint:disable all
import Amplify
import Foundation

extension SensorValue {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case sensorId
    case value
    case timestamp
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let sensorValue = SensorValue.keys
    
    model.authRules = [
      rule(allow: .private, provider: .iam, operations: [.create, .update, .delete, .read]),
      rule(allow: .public, provider: .apiKey, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "SensorValues"
    
    model.attributes(
      .primaryKey(fields: [sensorValue.id])
    )
    
    model.fields(
      .field(sensorValue.id, is: .required, ofType: .string),
      .field(sensorValue.sensorId, is: .required, ofType: .string),
      .field(sensorValue.value, is: .required, ofType: .double),
      .field(sensorValue.timestamp, is: .required, ofType: .int),
      .field(sensorValue.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(sensorValue.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension SensorValue: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}