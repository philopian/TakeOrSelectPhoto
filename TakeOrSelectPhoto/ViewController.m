#define RGB(r, g, b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#import "ViewController.h"

@interface ViewController ()
- (IBAction)takePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *takePhoto;

- (IBAction)selectPhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSelect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.takePhoto.layer.cornerRadius = 6;
    self.takePhoto.clipsToBounds = YES;
    self.takePhoto.backgroundColor = RGB(39, 41, 42);
    self.takePhoto.layer.borderColor = self.takePhoto.tintColor.CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma marks - Take or Select Photo
- (IBAction)takePhoto:(id)sender
{
    // check to see for device's that don't have a camera (app will crash without this logic)
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Sorry Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (IBAction)selectPhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}



#pragma marks - Implementing the Delegate Methods of UIImagePickerController

// user chooses an image or takes a photo
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageViewSelect.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

// User click's the "cancel" button
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}



@end
