//
//  Config.swift
//  SukkarApp
//
//  Created by amgad on 12/10/2566 BE.

import Foundation
import Alamofire
import MOLH
struct Config {
    static let URL = "https://sukkarkw.com/"
    static let MAIN_URL = "\(URL)api/"
    static let CUSTOMERS_ROUT_URL = "\(MAIN_URL)customers/"
    static let LOGIN = "\(CUSTOMERS_ROUT_URL)login"
    static let REGISTER = "\(MAIN_URL)customers"
    static let SLIDERS = "\(MAIN_URL)sliders"
  
}
let headers: HTTPHeaders = [
    "Content-Type":"application/json",
    "Authorization":"Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1OTIzMDI0NDksImV4cCI6MTkwNzY2MjQ0OSwiaXNzIjoiaHR0cDovL3N1a2FyLmhhcmR0YXNrLmluZm8iLCJhdWQiOlsiaHR0cDovL3N1a2FyLmhhcmR0YXNrLmluZm8vcmVzb3VyY2VzIiwiaHRfYXBpIl0sImNsaWVudF9pZCI6IjYzMzIwNTY0LWZjZGEtNDc1YS1iOTNhLTgzN2FmMDAzMDllMiIsInN1YiI6IjYzMzIwNTY0LWZjZGEtNDc1YS1iOTNhLTgzN2FmMDAzMDllMiIsImF1dGhfdGltZSI6MTU5MjMwMjQ0OCwiaWRwIjoibG9jYWwiLCJzY29wZSI6WyJodF9hcGkiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsicHdkIl19.N9uRJQdA4_zYNwspBtReFBBEPQeTT5Hf49hO40M6MtYO7IK7wJSAHwa0X977m69rRAfnvgCDgN3dVZ8zY_OkUIA1TncvDQuC0vFDBkj9IY6uz8CTDJ0pjlcqOPd7MjuQGIJtABvh2zPB--VpIw6Fi1EF9wKcOynDsCzUtwqnvGsdN-CqnecNbiEMd7Ct6I6MxFj-nZWzQtBv1X6i3vuDjpacTBYI4hoe3negNgtPuauu3qO_-GsaXF5vP7jdRT83TAAe2cGw1ZUzLLg1e6jECHHlZxQFfih1JbW-ySntGvtkZfeWPDMwtlIOzJQjYExz5SmUDBqp3AY4XcBj1GSPNA",
    "Accept-Language":MOLHLanguage.currentAppleLanguage()
]
