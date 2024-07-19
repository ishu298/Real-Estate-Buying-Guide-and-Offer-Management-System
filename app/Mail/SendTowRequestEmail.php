<?php

namespace App\Mail;

use App\Models\EmailTemplate;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendTowRequestEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $data;

    public function __construct($data)
    {
        $this->data = $data;
        
    }

    public function build()
    {  


        $template_data = EmailTemplate::where('alias_name', 'tow_request')->first();
        if (!$template_data) {
            return $this->subject('Template Not Found')
                        ->text('emails.template_not_found');
        }

        $content = $this->replacePlaceholders($template_data->template);
        return $this->subject('dynamic Mail')
                    ->view('emails.DynamicTemplateEmail', ['content' => $content]);
    }

    private function replacePlaceholders($content)
    {

        $replacements = [
            '{{name}}' => $this->data['name'],
            '{{passownername}}' => $this->data['passownername'],
            '{{phone}}' => $this->data['phone'],
            '{{text}}' => $this->data['text'],
            '{{license_plate}}' => $this->data['license_plate'],
            '{{unit_name}}' => $this->data['unit_name'],
            '{{towMessage}}' => $this->data['towMessage'],
            '{{logo}}' =>$this->data['porp_logo'],
            // Add more placeholders and replacements as needed
        ];

        return str_replace(array_keys($replacements), array_values($replacements), $content);
    }
}
