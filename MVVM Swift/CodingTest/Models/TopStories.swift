/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TopStories : Codable {
	let section : String?
	let subsection : String?
	let title : String?
	let abstract : String?
	let url : String?
	let byline : String?
	let item_type : String?
	let updated_date : String?
	let created_date : String?
	let published_date : String?
	let material_type_facet : String?
	let kicker : String?
	let des_facet : [String]?
	let org_facet : [String]?
	let per_facet : [String]?
	let geo_facet : [String]?
	let multimedia : [Multimedia]?
	let short_url : String?

	enum CodingKeys: String, CodingKey {

		case section = "section"
		case subsection = "subsection"
		case title = "title"
		case abstract = "abstract"
		case url = "url"
		case byline = "byline"
		case item_type = "item_type"
		case updated_date = "updated_date"
		case created_date = "created_date"
		case published_date = "published_date"
		case material_type_facet = "material_type_facet"
		case kicker = "kicker"
		case des_facet = "des_facet"
		case org_facet = "org_facet"
		case per_facet = "per_facet"
		case geo_facet = "geo_facet"
		case multimedia = "multimedia"
		case short_url = "short_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		item_type = try values.decodeIfPresent(String.self, forKey: .item_type)
		updated_date = try values.decodeIfPresent(String.self, forKey: .updated_date)
		created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
		published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
		material_type_facet = try values.decodeIfPresent(String.self, forKey: .material_type_facet)
		kicker = try values.decodeIfPresent(String.self, forKey: .kicker)
		des_facet = try values.decodeIfPresent([String].self, forKey: .des_facet)
		org_facet = try values.decodeIfPresent([String].self, forKey: .org_facet)
		per_facet = try values.decodeIfPresent([String].self, forKey: .per_facet)
		geo_facet = try values.decodeIfPresent([String].self, forKey: .geo_facet)
		multimedia = try values.decodeIfPresent([Multimedia].self, forKey: .multimedia)
		short_url = try values.decodeIfPresent(String.self, forKey: .short_url)
	}

}
