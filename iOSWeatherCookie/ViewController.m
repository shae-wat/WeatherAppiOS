//
//  ViewController.m
//  iOSWeatherCookie
//
//  Created by Shaelyn Watson on 1/28/16.
//  Copyright © 2016 Shaelyn Watson. All rights reserved.
//

#import "ViewController.h"
#define CURRENT_LAT 37.8267
#define CURRENT_LONG -122.423

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/85709eec804fd0f1065b210fa3dc2548/%f,%f", CURRENT_LAT, CURRENT_LONG];
    NSURL *weatherUrl = [NSURL URLWithString:url];
    NSData *jsonData = [NSData dataWithContentsOfURL:weatherUrl];
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSLog(@"%@", dataDictionary);
    
    self.weatherForecasts = [NSMutableDictionary dictionary];
    self.weatherForecasts = [dataDictionary objectForKey:@"currently"];
    NSLog(@"%@", self.weatherForecasts);
    
    
    self.currentTemperature = [self.weatherForecasts objectForKey:@"apparentTemperature"];
    self.currentHumidity = [self.weatherForecasts objectForKey:@"humidity"];
    self.currentPrecipProp= [self.weatherForecasts objectForKey:@"precipProbability"];
    self.currentSummary= [self.weatherForecasts objectForKey:@"summary"];
    self.currentWeatherIcon= [self.weatherForecasts objectForKey:@"icon"];
    
    self.lblTemperature.text = [NSString stringWithFormat:@"%@°", self.currentTemperature];
    self.lblHumidity.text = [NSString stringWithFormat:@"%@(grams of water vapor per cubic meter volume of air)", self.currentHumidity];
    self.lblPrecipProb.text = [NSString stringWithFormat:@"%@ inches",self.currentPrecipProp];
    self.lblSummary.text = self.currentSummary;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
