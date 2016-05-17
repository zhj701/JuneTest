//
//  API_Define.h
//  Insurance
//
//  Created by June on 16/2/1.
//  Copyright © 2016年 June. All rights reserved.
//

#ifndef API_Define_h
#define API_Define_h

#ifdef DEBUG
#define HOST_URL                @"http://192.168.2.27/JuneAPI/"
#else
#define HOST_URL                @"http://192.168.2.27/JuneAPI/"
#endif

// USER
#define REGISTER                [NSString stringWithFormat:@"%@User/register",HOST_URL]
#define LOGIN                   [NSString stringWithFormat:@"%@User/login",HOST_URL]
#define CONTACT                 [NSString stringWithFormat:@"%@User/contacts",HOST_URL]

#endif /* API_Define_h */
