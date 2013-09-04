// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Todo.h instead.

#import <CoreData/CoreData.h>


extern const struct TodoAttributes {
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *titile;
} TodoAttributes;

extern const struct TodoRelationships {
} TodoRelationships;

extern const struct TodoFetchedProperties {
} TodoFetchedProperties;






@interface TodoID : NSManagedObjectID {}
@end

@interface _Todo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TodoID*)objectID;





@property (nonatomic, strong) NSString* text;



//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* titile;



//- (BOOL)validateTitile:(id*)value_ error:(NSError**)error_;






@end

@interface _Todo (CoreDataGeneratedAccessors)

@end

@interface _Todo (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




- (NSString*)primitiveTitile;
- (void)setPrimitiveTitile:(NSString*)value;




@end
