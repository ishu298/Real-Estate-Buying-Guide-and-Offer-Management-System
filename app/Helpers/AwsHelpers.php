<?php

use Aws\S3\S3Client;
use Illuminate\Support\Facades\Storage;

if (!function_exists('uploadImageToS3')) {
      // function uploadImageToS3($file, $path = '')
    // {
    //     try {
    //         // Validate if a file was provided
    //         if (!$file) {
    //             throw new Exception('No image file provided.');
    //         }

    //         $fileName = time() . '.' . $file->getClientOriginalExtension();

    //         $s3Client = new S3Client([
    //             'credentials' => [
    //                 'key' => env('AWS_ACCESS_KEY_ID'),
    //                 'secret' => env('AWS_SECRET_ACCESS_KEY'),
    //             ],
    //             'region' => env('AWS_DEFAULT_REGION'),
    //             'version' => 'latest',
    //         ]);

    //         $bucketName = env('AWS_BUCKET');
    //         $imagePath = $path . $fileName;

    //         $s3Client->putObject([
    //             'Bucket' => $bucketName,
    //             'Key' => $imagePath,
    //             'Body' => file_get_contents($file),
    //             // 'ContentType' => $file->getMimeType(),
    //             // 'ACL' => 'public-read', // Set ACL to 'public-read'
    //         ]);

    //         return $fileName;
    //     } catch (Exception $e) {
    //         return $e->getMessage();
    //     }
    // }


    function uploadImageToS3($file, $path = '')
    {
        try {
            // Validate if a file was provided
            if (!$file) {
                throw new Exception('No image file provided.');
            }
    
            $fileName = time() . '.' . $file->getClientOriginalExtension();
    
            // Create an Intervention Image instance
            $image = Image::make($file);
    
            // Remove EXIF data to prevent automatic rotation
            $image->orientate()->encode(null, 70);
    
            // Get the encoded image as a string
            $imageData = $image->getEncoded();
    
            $s3Client = new S3Client([
                'credentials' => [
                    'key' => env('AWS_ACCESS_KEY_ID'),
                    'secret' => env('AWS_SECRET_ACCESS_KEY'),
                ],
                'region' => env('AWS_DEFAULT_REGION'),
                'version' => 'latest',
            ]);
    
            $bucketName = env('AWS_BUCKET');
            $imagePath = $path . $fileName;
    
            $s3Client->putObject([
                'Bucket' => $bucketName,
                'Key' => $imagePath,
                'Body' => $imageData,
            ]);
    
            return $fileName;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
    
    
}

// Delete an Image from AWS S3 Bucket
function deleteImageFromS3($fileName, $path = '')
{
    try {
        $s3Client = new S3Client([
            'credentials' => [
                'key' => env('AWS_ACCESS_KEY_ID'),
                'secret' => env('AWS_SECRET_ACCESS_KEY'),
            ],
            'region' => env('AWS_DEFAULT_REGION'),
            'version' => 'latest',
        ]);

        $bucketName = env('AWS_BUCKET');
        $imagePath = $path . $fileName;

        $s3Client->deleteObject([
            'Bucket' => $bucketName,
            'Key' => $imagePath,
        ]);

        return true; // Deletion successful
    } catch (AwsException $e) {
        return $e->getMessage();
    }
}



if (!function_exists('getS3Image')) {
    function getS3Image($path)
    {
        try {
            $s3Client = new S3Client([
                'credentials' => [
                    'key' => env('AWS_ACCESS_KEY_ID'),
                    'secret' => env('AWS_SECRET_ACCESS_KEY'),
                ],
                'region' => env('AWS_DEFAULT_REGION'),
                'version' => 'latest',
            ]);

            $bucketName = env('AWS_BUCKET');

            // Get the file content from S3
            $fileContent = Storage::disk('s3')->get($path);

            return $fileContent;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}

