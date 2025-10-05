//
//  GetPhotoOfDayResponse.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 2.10.25.
//
import Foundation

nonisolated struct GetPhotoOfDayResponse: Decodable,Hashable {
    public var date: String?
    public var explanation: String?
    public var hdurl: String?
    public var media_type: String?
    public var service_version: String?
    public var title: String?
    public var url: String?
    
    public enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case hdurl
        case media_type
        case service_version
        case title
        case url
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try? container.decode(String.self, forKey: .date)
        explanation = try? container.decode(String.self, forKey: .explanation)
        hdurl = try? container.decode(String.self, forKey: .hdurl)
        media_type = try? container.decode(String.self, forKey: .media_type)
        service_version = try? container.decode(String.self, forKey: .service_version)
        title = try? container.decode(String.self, forKey: .title)
        url = try? container.decode(String.self, forKey: .url)
    }
}

		
