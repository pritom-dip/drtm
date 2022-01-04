<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Payment;

class PaymentController extends Controller
{

    public function index()
    {
        $query  = Payment::latest();
        $breadcumbs = $this->breadcumbs('payment', 'index');
        $datas      = $query->paginate(10);
        return view('admin.payment.index', compact('datas'));
    }

    public function show($id)
    {
        $payment = Payment::find($id);
        $breadcumbs = $this->breadcumbs('payment', 'show');

        return view('admin.payment.show', compact( "payment", "breadcumbs"));
    }

}
