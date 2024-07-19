<style>
    #invoiceSection {
        font-family: sans-serif;
        background-color: #f5f5f5;
        /* Light gray background for contrast */
        border-radius: 10px;
        /* Soften edges */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        /* Add subtle shadow */
    }
  
    .card {
        background-color: #fff;
        /* White card background */
        border: none;
        /* Remove default border */
        border-radius: 10px;
        /* Match container's border radius */
        padding: 20px;
        /* Generous padding for content */
    }
  
    .card-body {
        line-height: 1.6;
        /* Improve readability */
    }
  
    .border-top {
        border-top: 1px solid #e5e5e5;
        /* Light gray dividers for sections */
        padding-top: 20px;
        /* Add spacing above dividers */
    }
  
    table {
        width: 100%;
        border-collapse: collapse;
    }
  
    th,
    td {
        padding: 10px;
        text-align: left;
        /* Align text for better readability */
        border-bottom: 1px solid #e5e5e5;
    }
  
    th {
        background-color: #f5f5f5;
        /* Light gray header background */
        font-weight: bold;
    }
  
    td {
        font-size: 0.9rem;
        /* Slightly smaller font for table data */
    }
  
    /* Adjust spacing for smaller screens */
    @media (max-width: 768px) {
        .card-body {
            padding: 15px;
        }
    }
  
  
    h2 {
        font-size: 1.5rem;
        margin-bottom: 10px;
    }
  
    strong {
        font-weight: bold;
    }
  
    .text-muted {
        color: #888;
    }
  
    .text-purple {
        color: #6f42c1;
        /* Accent color for email and address */
    }
  
    .text-success {
        color: #28a745;
        /* Highlight for total amount */
    }
  
    .mb-2 {
        margin-bottom: 10px;
    }
    .text_bold{
      font-weight: 700;
      /* font-size: 16px; */
      color: black
    }
  </style>
  
  <div class="container mt-6 mb-7" id="invoiceSection">
    <div>
        <div class="col-lg-12 col-xl-7">
            <div class="card">
                <div class="card-body p-5">
                    <div style="">
                        <div>
                            <img src="https://console.danielhanart.com/frontend/images/logo.svg" alt="Danielhanart"
                                style="max-width: 150px;">
                        </div>
  
                        <div>
                            <h2 style="margin-top:20px;margin-bottom:20px;">
                                Hey {{ $orderData->first_name . ' ' . $orderData->last_name }},
                            </h2>
                        </div>
                    </div>
  
  
                    <table>
                        <tr>
                            <th>Order Information</th>
                            <th>Payment Summary</th>
                        </tr>
                        <tr>
                           
                            <td>
                              
                              <div class="text-muted mb-2"><span class="text_bold"> Order Id: </span> {{ ucwords($orderData->unique_id) }}</div>
  
                                <div class="text-muted mb-2">
                                    <span class="text_bold">Name:</span> {{ $orderData->first_name . ' ' . $orderData->last_name }}
                                </div>
                                <div class="text-muted mb-2"><span class="text_bold"> Email: </span> {{ $orderData->email }}</div>
                                <div class="text-muted mb-2"><span class="text_bold"> Phone: </span> {{ $orderData->phone }}</div>
                                <div class="text-muted mb-2"><span class="text_bold"> Address: </span> {{ $orderData->address }}, {{ $orderData->city }},
                                    {{ $orderData->landmark }}, {{ $orderData->country }}</div>
                               
                                <div class="text-muted mb-2"><span class="text_bold"> Order Date: </span> {{ $orderData->created_at }}</div>
                            </td>
  
                            <td>
  
  
                                <div class="border rounded p-2 card" style="border: 1px solid lightgray;">
                                    {{-- <div class="mb-2 fw-bold">Payment Summary</div> --}}
                                    <div class="">
                                        @php
                                          $shippingChargeSum = $orderData->items->pluck('dimension.shipping_charge')->sum();
  $subtotalSum = $orderData->items->pluck('dimension.offer_price')->sum();
  
                                        @endphp
                                        <table class="table table-borderless table-transparent table-sm small m-0">
                                            <tbody>
                                                <tr>
                                                    <td>Items</td>
                                                    <td>{{ count($orderData->items) }}</td>
                                                </tr>
                                                <tr>
                                                    <td>Subtotal</td>
                                                    <td>${{ $subtotalSum }}</td>
                                                </tr>
                                                <tr>
                                                    <td>Shipping &amp; Packaging Charges</td>
                                                    <td>${{ $shippingChargeSum }}</td>
                                                </tr>
                                                <tr>
                                                    <td>Total</td>
                                                    <td>${{ $orderData->total_amount }}</td>
                                                </tr>
  
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
  
                            </td>
                        </tr>
  
                    </table>
  
                    <div class="border-top border-gray-200"></div>
  
  
                    <table class="table border-bottom border-gray-200 mt-3">
                        <thead>
                            <tr>
                                <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">
                                    Product Images
                                </th>
  
                                <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">
                                    Products
                                </th>
                                <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">
                                  Dimension</th>
                                <th scope="col" class="fs-sm text-dark text-uppercase-bold-sm text-end px-0">
                                    Amount
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orderData->items as $item)
                                <tr>
                                    <td class="px-0"><img
                                            src="{{ $item->product->featuredimage != '' ? $item->product->featuredimage[0]['path'] : '' }}"
                                            alt="" srcset="" width="150"></td>
                                    <td class="px-0">{{ $item->product->title }}</td>
                                    <td class="px-0">{{ $item->dimension->dimensions }}</td>
                                    <td class="text-end px-0">
                                        {{ $item->dimension->offer_price }}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
  </div>
  