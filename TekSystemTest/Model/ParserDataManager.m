//
//  ParserDataManager.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "ParserDataManager.h"

// feed news url
//NSString *newsFeedUrl = @"http://images.apple.com/main/rss/hotnews/hotnews.rss";
NSString *newsFeedUrl = @"http://rss.cnn.com/rss/cnn_topstories.rss";

@implementation ParserDataManager

+(instancetype)sharedManager
{
    return [[ParserDataManager alloc] init];
}

- (void)startNewsParsing
{
    self.feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:newsFeedUrl];
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [self.parser setDelegate:self];
    [self.parser setShouldResolveExternalEntities:NO];
    [self.parser parse];
}

#pragma XMLParser delegate 
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
    if ([self.element isEqualToString:@"item"]) {
        
        self.item    = [[NSMutableDictionary alloc] init];
        self.title   = [[NSMutableString alloc] init];
        self.link    = [[NSMutableString alloc] init];
        self.newsDescription    = [[NSMutableString alloc] init];
        self.imageUrl = [[NSMutableString alloc] init];
    }
    
    if ([elementName isEqualToString:@"media:thumbnail"])
    {
        self.imageUrl = attributeDict[@"url"];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
 
    if ([elementName isEqualToString:@"item"]) {
        
        [self.item setObject:self.title forKey:@"title"];
        [self.item setObject:self.link forKey:@"link"];
        [self.item setObject:self.newsDescription forKey:@"description"];
        [self.item setObject:self.imageUrl forKey:@"url"];
        
        [self.feeds addObject:[self.item copy]];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSLog(@"elements name %@",self.element);
    if ([self.element isEqualToString:@"title"]) {
        [self.title appendString:string];
    } else if ([self.element isEqualToString:@"link"]) {
        [self.link appendString:string];
    }
    else if ([self.element isEqualToString:@"description"])
    {
        [self.newsDescription appendString:string];
    } else if ([self.element isEqualToString:@"media:thumbnail"])
    {
        NSLog(@"bala image  %@",string);
    }

    
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parser error %@",parseError);
}
- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
NSLog(@" parser validation error %@",validationError);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.dataManagerDelegate didUpdateData:self.feeds];
}


@end
