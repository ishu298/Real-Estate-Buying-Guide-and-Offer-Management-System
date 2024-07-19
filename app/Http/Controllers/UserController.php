<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use App\Models\User;
use App\Models\Contact;
use App\Models\Enquire;
use App\Models\Setting;
use App\Models\Category;
use App\Models\Newsletter;
use App\Models\ContactReply;
use App\Models\EnquireReply;
use Illuminate\Http\Request;
use App\Mail\SendContactMail;
use App\Mail\SendEnquireMail;
use App\Models\EmailTemplate;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;


class UserController extends Controller
{
    public function list()
    {
        $currentUser = Auth::user();
        $data = User::orderBy('created_at', 'DESC')->get();
        // dd($data);
        return view('admin.user.list', ['lists' => $data]);
    }

    public function add()
    {
        return view('admin.user.add');
    }

   
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return redirect('user/list');
    }
    

    public function edit($id)
    {
        $data = User::find($id);
        return view('admin.user.edit', ['edits' => $data]);
    }

    public function update(Request $request)
{
    // dd($request->all());
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users,email,'.$request->user_id,
        'password' => 'nullable|string|min:8' // Updated to allow password to be nullable
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors());
    }

    $user = User::findOrFail($request->user_id);

    // Update name and email
    $user->name = $request->name;
    $user->email = $request->email;

    // Update password if provided
    if (!empty($request->password)) {
        $user->password = Hash::make($request->password);
    }

    $user->save();

    return redirect('user/list');
}


    public function destroy($id)
    {
        $data = User::find($id);
        $data->delete();
        return redirect('user/list');
    }

    public function cms_setting(){
        $lists = Setting::get();
        return view('admin.user.cmd_setting',compact('lists'));
    }



    public function store_cms_setting(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return redirect('user/list');
    }
    
    public function add_cmd_setting()
    {
        return view('admin.user.add_cmd_setting');
    }

    public function manage_about_us(){
      $data =  Setting::where('slug','about_us')->first();
      return view('admin.cms.about-us',compact('data'));
    }

  
    public function add_n_update_about_us(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'about_us')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
            if ($request->hasFile('featuredimages')) {
                $image = $request->file('featuredimages');
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->move(public_path('featured-image'), $imageName);
                $setting->update(['image' => $imageName]); 
             }

        } else {
            $imageName = null;
            if ($request->hasFile('featuredimages')) {
                $image = $request->file('featuredimages');
                $imageName = time() . '_' . $image->getClientOriginalName();
                $image->move(public_path('featured-image'), $imageName);
             }

             $setting = Setting::create([
                'slug' => 'about_us',
                'value' => $data['body'],
                'image' => $imageName
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }


    
      public function add_n_update_about_us_image(Request $request)
      {
          ini_set('upload_max_filesize', '64M');
          ini_set('post_max_size', '64M');
          try {
          $request->validate([
              'featuredimages' => 'required|file|mimes:jpeg,png,jpg,gif|max:102400', // 100MB in kilobytes
          ]);
      
          $setting = Setting::where('slug', 'about_us_image')->first();
      
          if ($request->hasFile('featuredimages')) {
              $image = $request->file('featuredimages');
              $imageName = uploadImageToS3($image, env('AWS_FOLDER_NAME'));
          } else {
              $imageName = null;
          }
      
          if ($setting) {
              $setting->update(['image' => $imageName]);
          } else {
              $setting = Setting::create([
                  'slug' => 'about_us_image',
                  'image' => $imageName,
              ]);
          }
          return redirect()->route('admin.manage_website_setting'); 
        } catch (\Exception $e) {
            // Log the exception details
            \Log::error('File Upload Error: ' . $e);
            // You can also return a response with the error message
            return redirect()->route('admin.manage_website_setting');       
        }
      
       
      }
      


    //   public function manage_contact_info(){
    //     $data =  Setting::where('slug','contact_information')->first();
    //     return view('admin.cms.contact-info',compact('data'));
    // }

    // public function manage_privacy_policy(){
    //     $data =  Setting::where('slug','privacy_policy')->first();
    //     return view('admin.cms.manage-privacy-policy',compact('data'));
    //   }

      public function add_n_update_privacy_policy(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'privacy_policy')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'privacy_policy',
                'name' => 'privacy_policy',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }


    //   public function terms_conditions(){
    //     $data =  Setting::where('slug','terms_conditions')->first();
    //     return view('admin.cms.terms_conditions',compact('data'));
    //   }

      public function add_n_update_terms_conditions(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'terms_conditions')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'terms_conditions',
                'name' => 'terms_conditions',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }

      public function add_n_update_adorn_description(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'adorn_description_data')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'adorn_description_data',
                'name' => 'adorn_description_data',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }


      public function add_n_update_acquire_description(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'acquire_description_data')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'acquire_description_data',
                'name' => 'acquire_description_data',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }

      public function add_n_update_art_description(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'art_description_data')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'art_description_data',
                'name' => 'art_description_data',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }


      public function add_n_update_contact_description(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'contact_description_data')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
          
        } else {
             $setting = Setting::create([
                'slug' => 'contact_description_data',
                'name' => 'contact_description_data',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }
      

      
      

    //   public function manage_contact_info(){
    //     $data =  Setting::where('slug','contact_information')->first();
    //     return view('admin.cms.contact-info',compact('data'));
    // }

    public function manage_website_setting(){
        $data = Setting::where('slug','footer_text')->first();
        $about_data =  Setting::where('slug','about_us')->first();
        $about_us_image =  Setting::where('slug','about_us_image')->first();
        $contact_data =  Setting::where('slug','contact_information')->first();
        $privacy_policy_data =  Setting::where('slug','privacy_policy')->first();
        $terms_conditions_data =  Setting::where('slug','terms_conditions')->first();
        $adorn_description_data =  Setting::where('slug','adorn_description_data')->first();
        $acquire_description_data =  Setting::where('slug','acquire_description_data')->first();
        $art_description_data =  Setting::where('slug','art_description_data')->first();
        $contact_description_data =  Setting::where('slug','contact_description_data')->first();
        $copyright_text_data =  Setting::where('slug','copyright_text')->first();
        $why_we_use_text =  Setting::where('slug','why_we_use_text')->first();
        $why_we_use_text_video = Setting::where('slug', 'why_we_use_text')->pluck('image')->first();
        
        return view('admin.cms.manage_footer_text',compact('data','about_data','contact_data','privacy_policy_data','terms_conditions_data','adorn_description_data','acquire_description_data','art_description_data','contact_description_data','about_us_image','copyright_text_data','why_we_use_text','why_we_use_text_video'));
    }

    public function update_footer_text(Request $request){
        $data = $request->all();
        $setting = Setting::where('slug', 'footer_text')->first();
        $copyright_setting = Setting::where('slug', 'copyright_text')->first();

        if ($setting) {
            $setting->update([
                'value' => $data['body'],
            ]);
            $copyright_setting->update([
                'value'=>$data['copyright_text'],
            ]);
        } else {
             $setting = Setting::create([
                'slug' => 'footer_text',
                'name' => 'footer_text',
                'value' => $data['body'],
            ]);
        }

        return redirect()->route('admin.manage_website_setting');       
      }




         public function store_contact_info(Request $request)
        {
            $validatedData = $this->validate($request, [
                'address' => 'nullable|string',
                'email' => 'required|email',
                'phone' => 'nullable|string',
                'linkedin_url' => 'nullable|url',
                'instagram_url' => 'nullable|url',
            ]);
            
                $contactInfo = json_encode($validatedData);
                Setting::updateOrCreate(['slug' => 'contact_information'], ['value' => $contactInfo]);
                return redirect()->route('admin.manage_website_setting');   
        }




    public function contact_list(){
        $lists = Contact::orderBy('created_at',"DESC")->get();
        return view('admin.user.contact_list',compact('lists'));
    }

    public function contact_all_reply($id){
        $lists = Contact::with('contact_replies')->orderBy('created_at',"DESC")->find($id);
        return view('admin.user.contact_all_reply',compact('lists'));
    }
    

    public function contact_detail($id){
        $data = Contact::find($id);
        return view('admin.user.contact_detail',compact('data'));
    }


    public function send_contact_reply(Request $request){
        $data = Contact::find($request->contact_id);
        // dd($data['email']);
        ContactReply::create([
            "reply_text" => $request->reply_text,
            "contact_id" => $request->contact_id,
        ]);
        try {
            Mail::to($data['email'])->send(new SendContactMail($data,$request->reply_text));
        } catch (\Throwable $th) {
            //throw $th;
        }
        return redirect('request/contact')->with('success', 'Reply Successfully Sent.');;
    }


    public function send_enquire_reply(Request $request){
        $data = Enquire::find($request->enquire_id);
        EnquireReply::create([
            "reply_text" => $request->reply_text,
            "enquire_id" => $request->enquire_id,
        ]);
        try {
            Mail::to($data['email'])->send(new SendEnquireMail($data,$request->reply_text));
        } catch (\Throwable $th) {
            //throw $th;
        }
        return redirect('request/enquire')->with('success', 'Reply Successfully Sent.');;
    }

    public function enquire_all_reply($id){
        $lists = Enquire::with('enquire_replies')->orderBy('created_at',"DESC")->find($id);
        // dd($lists);
        return view('admin.user.enquire_all_reply',compact('lists'));
    }


    public function delete_enquire_reply($id,$enquire_id)
    {
        $enquire = EnquireReply::find($id); 
        if ($enquire) {
            $enquire->delete();
        } else {
            return Redirect::back()->with('error', 'Contact not found.'); // Redirect back with an error message
        }
    
        return redirect()->route('admin.enquire_all_reply', ['id' => $enquire_id]);
    }




    public function delete_contact($id)
    {
        $contact = Contact::find($id);
    
        if ($contact) {
            $contact->delete();
        } else {
            return Redirect::back()->with('error', 'Contact not found.'); // Redirect back with an error message
        }
    
        return redirect('request/contact');
    }

    public function delete_contact_reply($id,$contact_id)
    {
        $contact = ContactReply::find($id); 
        if ($contact) {
            $contact->delete();
        } else {
            return Redirect::back()->with('error', 'Contact not found.'); // Redirect back with an error message
        }
    
        return redirect()->route('admin.contact_all_reply', ['id' => $contact_id]);
    }


    

    public function enquire_list(){
        $lists = Enquire::with('product')->orderBy('created_at',"DESC")->get();
        return view('admin.user.enquire_list',compact('lists'));
    }

    public function enquire_detail($id){
        $data = Enquire::with('product')->find($id);
        return view('admin.user.enquire_detail',compact('data'));
    }


    public function delete_enquire($id)
    {
        $contact = Enquire::find($id);
    
        if ($contact) {
            $contact->delete();
        } else {
            return Redirect::back()->with('error', 'Contact not found.'); // Redirect back with an error message
        }
    
        return redirect('request/enquire');
    }

    public function newsletter(){
        $newsletters=Newsletter::orderBy('created_at', 'DESC')->paginate(10);
        // dd($newsletters);
        return view("admin.user.newsletter", compact("newsletters"));
    }

    
    public function delete_newsletter($id)
    {
        $newsletter = Newsletter::find($id); 
        if ($newsletter) {
            $newsletter->delete();
        } else {
            return Redirect::back()->with('error', 'Newsletter not found.'); // Redirect back with an error message
        }
        return redirect()->route('admin.newsletter');
    }

    public function manage_email_template(){
        $templates=EmailTemplate::orderBy('created_at', 'DESC')->get();
        return view('admin.emailtemplate.manage_email_template',compact('templates'));
    }

    public function edit_email_template($id){
        $templates=EmailTemplate::where('id',$id)->first();
        // dd($templates);
        return view('admin.emailtemplate.edit_email_template',compact('templates'));
    }



    public function update_email_template(Request $request)
{   
    // dd($request->all());
    $emailtemplate = EmailTemplate::findOrFail($request->id);
    $emailtemplate->name = $request->name;
    $emailtemplate->subject = $request->subject;
    $emailtemplate->template = $request->template;
    $emailtemplate->save();
    return redirect()->route('admin.manage_email_template');
}


    public function delete_email_template($id)
    {
        $email = EmailTemplate::find($id);

        if ($email) {
            $email->delete();
        } else {
            return Redirect::back()->with('error', 'Email Template not found.'); // Redirect back with an error message
        }

        return redirect()->route('admin.manage_email_template');
    }
    

    public function theme_setting(){
        $home_category_color = Setting::where('slug','home_category_color')->first();
        $home_newsletter_color = Setting::where('slug','home_newsletter_color')->first();
       
        return view('admin.cms.theme_setting',compact('home_category_color','home_newsletter_color'));
    }

    public function update_theme_setting(Request $request){
        $data = $request->all();
        $home_category_color = Setting::where('slug','home_category_color')->first();
        $home_newsletter_color = Setting::where('slug','home_newsletter_color')->first();
        $home_category_color->update([
            'value' => $data['category_bg_color'],
        ]);
        $home_newsletter_color->update([
            'value' => $data['newsletter_bg_color'],
        ]);
        return redirect()->route('admin.theme_setting');   
    }


    
    public function add_n_update_art_wydouse(Request $request){
        try {
        
        $setting = Setting::where('slug','why_we_use_text')->first();
        // dd($setting);
               // Save text data
        $setting->value = $request->why_we_use_text;

        // Handle file upload
        if ($request->hasFile('artvideo')) {
            $video = $request->file('artvideo');
            $videoName = time() . '_' . $video->getClientOriginalName();
            $video->move(public_path('featured-image'), $videoName);
                $setting->image = $videoName;
        }

        $setting->save();
        return redirect()->route('admin.manage_website_setting');      
        } catch (\Exception $e) {
            // Log the error
            \Log::error($e->getMessage());
            // Redirect with error message
            return redirect()->route('admin.manage_website_setting')->with('error', 'An error occurred while uploading art and video. Please try again later.');
        }     
      }

}
