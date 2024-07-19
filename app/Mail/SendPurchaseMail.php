<?php

namespace App\Mail;

use App\Models\EmailTemplate;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendPurchaseMail extends Mailable
{
    use Queueable, SerializesModels;

    public $data;

    public function __construct($data)
    {
        $this->data = $data;
        
    }

    public function build()
    {  


        $template_data = EmailTemplate::where('alias_name', 'SendPurchaseMail')->first();
        if (!$template_data) {
            return $this->subject('Template Not Found')
                        ->text('emails.template_not_found');
        }

        $content = $this->replacePlaceholders($template_data->template);
        return $this->subject(isset($template_data->subject) ? $template_data->subject : '')
                    ->view('emails.DynamicTemplateEmail', ['content' => $content]);
    }

    private function replacePlaceholders($content)
    {

        $replacements = [
            '{{name}}' => ucwords($this->data['first_name']),
            '{{order}}' => $this->data['unique_id'],
            '{{address}}' => $this->data['address'].', '. $this->data['city'] != "" ? $this->data['city'] : '',
            '{{amount}}' => $this->data['total_amount'],

        ];

        return str_replace(array_keys($replacements), array_values($replacements), $content);
    }
}
