//
//  ParserDataManager.h
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ParserDataManagerDelegate <NSObject>

- (void)didUpdateData:(NSMutableArray *)dataManager;

@end

@interface ParserDataManager : NSObject <NSXMLParserDelegate>

@property(nonatomic, strong) NSXMLParser *parser;
@property(nonatomic, strong) NSMutableArray *feeds;
@property(nonatomic, strong) NSMutableDictionary *item;
@property(nonatomic, strong) NSMutableString *title;
@property(nonatomic, strong) NSMutableString *link;
@property(nonatomic, strong) NSString *element;

@property (nonatomic, strong) NSMutableString *newsDescription;
@property (nonatomic, strong) NSData *imagedata;
@property (nonatomic, strong) NSMutableString *imageUrl;



@property (nonatomic, weak) id <ParserDataManagerDelegate> dataManagerDelegate;


- (void)startNewsParsing;
+(instancetype)sharedManager;
@end
