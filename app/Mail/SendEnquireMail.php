<?php

namespace App\Mail;

use App\Models\EmailTemplate;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendEnquireMail extends Mailable
{
    use Queueable, SerializesModels;

    public $data;
    public $replyText;
    public function __construct($data,$replyText)
    {
        $this->data = $data;
        $this->replyText = $replyText;
        
    }

    public function build()
    {  


        $template_data = EmailTemplate::where('alias_name', 'SendEnquireMail')->first();
        if (!$template_data) {
            return $this->subject('Template Not Found')
                        ->text('emails.template_not_found');
        }

        $content = $this->replacePlaceholders($template_data->template);
        return $this->subject(isset($this->data['subject']) ? $this->data['subject'] : '')
                    ->view('emails.DynamicTemplateEmail', ['content' => $content]);
    }

    private function replacePlaceholders($content)
    {

        $replacements = [
            '{{name}}' => $this->data['name'],
            '{{content}}' => $this->replyText,
        ];

        return str_replace(array_keys($replacements), array_values($replacements), $content);
    }
}
