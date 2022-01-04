<?php

namespace App\Http\Controllers;
use App\Model\Service;
use App\Model\Payment;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Str;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function donate($id)
    {
        $service = Service::find($id);
        $services = Service::latest()->get();
        return view('frontend.donate', compact('services', 'service'));
    }

    public function submit_donation(Request $request, $id)
    {
        $this->validation($request);

        $payment = Payment::create([
            "service_id" => $request->input("service_id"),
            "user_id"    => Auth::user()->id,
            "tran_id"   => md5(Str::random(9)),
            "mobile"    => $request->input("mobile"),
            "amount"    => $request->input("amount"),
            "message"    => $request->input("message"),
            "status"    => "pending",
        ]);

        $pay  = app("App\Http\Controllers\SslCommerzPaymentController");
        $abc =  $pay->index($payment);
    }

    private function validation($request){
        $this->validate($request,[
            'service_id'  => "required",
            'amount'  => "numeric|required",
        ]);
    }

    public function transactions(){
        $user_id = Auth::user()->id;
        $transactions = Payment::where('user_id', $user_id)->where('status', 'success')->get();
        dd($transactions);
    }

}
