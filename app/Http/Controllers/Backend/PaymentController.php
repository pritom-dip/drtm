<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Model\Payment;
use App\Model\Service;
use Carbon\Carbon;
use Illuminate\Http\Request;

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

    public function getReport(){
        $allPayments        = Payment::get();
        $services           = Service::get();
        $payments           = Payment::paginate(10);
        $revenuesSum     = $allPayments->sum('amount');
        $groupByRevenues = $allPayments->groupBy('service_id');
        $breadcumbs = $this->breadcumbs('payment', 'index');
        return view(
            'admin.reports.index',
            compact(
                'breadcumbs',
                'revenuesSum',
                'groupByRevenues',
                'payments',
                'services'
            )
        ); 
    }

    public function reports(Request $request){
        $service_id = $request->input("service_id");
        $date       = $request->input("date");
        $query = Payment::latest();
        if (!empty($service_id)) {
            $query->where("service_id", $service_id);
        }
        if (!empty($date)) {
            if ($date == 'today') {
                $data = $query->whereDate('created_at', date('Y-m-d'))->get();
            } else if ($date == 'this_week') {
                $data = $query->whereDate('created_at', '>=', Carbon::now()->subDays(7))->get();
            } else if ($date == 'this_month') {
                $data = $query->whereMonth('created_at', Carbon::now()->month)->get();
            } else if ($date == 'last_six_month') {
                $data = $query->whereMonth('created_at', '>=', Carbon::now()->submonths(6))->get();
            } else if ($date == 'this_year') {
                $data = $query->whereYear('created_at', date('Y'))->get();
            }
        }

        $allPayments        = $query->get();
        $services           = Service::get();
        $payments           = $query->paginate(10);
        $revenuesSum     = $allPayments->sum('amount');
        $groupByRevenues = $allPayments->groupBy('service_id');
        $breadcumbs = $this->breadcumbs('payment', 'index');
        return view(
            'admin.reports.index',
            compact(
                'breadcumbs',
                'revenuesSum',
                'groupByRevenues',
                'payments',
                'services'
            )
        ); 
    }

}
