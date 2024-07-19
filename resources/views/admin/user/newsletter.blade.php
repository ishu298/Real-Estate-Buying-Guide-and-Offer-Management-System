@extends('layouts.master')
@section('content')
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
          
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Email</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $Sno = 1; ?>
                        @foreach ($newsletters as $list)
        
                            <tr>
                                <td>{{ $Sno }}</td>
                                <td>{{ $list->email }}</td>
                                <td>{{ $list->created_at }}</td>
                                <td>                              
                                    <a class="btn btn-danger" href="{{ route('admin.delete_newsletter', ['id' => $list['id']]) }}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                            <?php $Sno++; ?>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form id="replyForm" action="{{route('admin.send_contact_reply')}}" method="POST">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="replyModalLabel">Reply to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="contact_id" name="contact_id" />
                        <div class="form-group">
                            <label for="replyText">Reply Text:</label>
                            <textarea class="form-control" id="replyText" name="reply_text" rows="4" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send Reply</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

<script>
    function reply_send(id){
        $("#replyModal").modal("show");
        $("#contact_id").val(id);
    }
    //   $('.btn-primary').on('click', function() {
    //     console.log('helo');
    //             // Find the email in the same row and populate the modal's hidden input
    //             var email = $(this).closest('tr').find('td:eq(2)').text();
    //             $('#emailField').val(email);
    //             $('#replyModal').modal('show');
    //         });
</script>