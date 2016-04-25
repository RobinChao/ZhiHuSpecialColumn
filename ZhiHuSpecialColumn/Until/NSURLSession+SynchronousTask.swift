//
//  NSURLSession+SynchronousTask.swift
//  ZhiHuSpecialColumn
//
//  Created by Robin on 4/25/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import Foundation

enum AppException : ErrorType {
    case Other(String)
}


extension NSURLSession {
    func sendSynchronousDataTaskWithRequest(request: NSURLRequest) throws -> NSData? {
        var response: NSURLResponse? = nil
        return try sendSynchronousDataTaskWithRequest(request, response: &response)
    }
    
    func sendSynchronousDataTaskWithRequest(request: NSURLRequest, inout response: NSURLResponse?) throws -> NSData? {
        let semaphone: dispatch_semaphore_t = dispatch_semaphore_create(0)
        var data: NSData? = nil
        var error: NSError? = nil
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (taskData, taskResponse, taskError) -> Void in
            
            data = taskData
            
            if let _response = taskResponse {
                response = _response
            }
            
            error = taskError
            
            dispatch_semaphore_signal(semaphone)
        }.resume()
        
        dispatch_semaphore_wait(semaphone, DISPATCH_TIME_FOREVER)
        
        if let _error = error {
            throw AppException.Other(_error.description)
        }
        
        return data
    }
    
    
    func sendSynchronousDataTaskWithURL(url:NSURL) throws -> NSData?{
        
        var response:NSURLResponse? = nil
        
        return try self.sendSynchronousDataTaskWithURL(url, returningResponse: &response)
        
    }
    
    func sendSynchronousDataTaskWithURL(url:NSURL,inout returningResponse response:NSURLResponse?) throws -> NSData?{
        let semaphore:dispatch_semaphore_t = dispatch_semaphore_create(0)
        
        var data:NSData? = nil
        
        var error:NSError? = nil
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (taskData, taskResponse, taskError) -> Void in
            data = taskData
            if let _response = taskResponse {
                response = _response
            }
            
            error = taskError
            
            dispatch_semaphore_signal(semaphore);
            }.resume()
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        if let _error = error {
            throw AppException.Other(_error.description)
        }
        
        return data
    }
    

}
