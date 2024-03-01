//
//  APIDownload.swift
//  ZStore
//
//  Created by APPLE on 29/11/23.
//

import Foundation
import UIKit

class APIDownload : NSObject {
    //MARK:- sendGetMethod
    class func sendGetMethod(_ url:String,completion:@escaping (_ resultDic:NSDictionary)->Void){
        let baseURL = url
        //        baseURL = baseURL.appending("&encode=\(Extensions.getLicenseKey())")
        print(baseURL)
        // Encoding the URL
        let encodedUrl : String! = baseURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        // Creating a request
        let request = URLRequest.init(url:URL(string:encodedUrl)!, cachePolicy:NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 120)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(30)
        configuration.timeoutIntervalForResource = TimeInterval(30)
        
        let session = URLSession(configuration: configuration)
        
        //API Call using URLSession
        let getMethodTask = session.dataTask(with: request, completionHandler: { (data,response,error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if error != nil{
                    //Error here
                }else{
                    if data != nil{
                        do{
                            var resultDictionary:NSDictionary! = NSDictionary()
                            
                            resultDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                            resultDictionary = resultDictionary as NSDictionary
                            print(resultDictionary)
                            
                            if resultDictionary != nil && resultDictionary.count>0{
                                // Successful conversion,Calling Handler now
                                completion(resultDictionary)
                            } else{
                                
                            }
                        } catch{
                            print("Failure getting data")
                        }
                    }
                }
            })
        })
        getMethodTask.resume()
    }
}
