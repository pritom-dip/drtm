<div class="row mt-3">
    <div class="col-12">
        <div class="box no-border">  
            <div class="box-header">
                <h3 class="box-title"><i class="fa fa-search"></i> Select Criteria</h3>
            </div>
            
            <div class="box-body">
                <div class="row">
                    <div class="col-3 pb-0">
                        <div class="form-group">
                            <label class="control-label">Type</label>
                            <select id="ssl-history" class="form-control form-control-sm" autocomplete="off">        
                                <option value="" selected="">Select</option>
                                <option value="today">Today</option>
                                <option value="this_week">This Week</option>
                                <option value="this_month">This Month</option>
                                <option value="last_six_month">Last 6 Months</option>
                                <option value="this_year">This Year</option>
                            </select>
                            <span class="text-danger"></span>
                        </div>
                    </div>
                    
                    <div class="col-3 pt-4">
                        <button type="submit" name="search" id="allSslBtn" class="btn btn-primary btn-sm checkbox-toggle"><i class="fa fa-search"></i> Search</button>
                    </div>

                    <div class="col-2 pt-4">
                        <a href="#" onclick="printContent('print')" class="btn btn-sm btn-info printSelected pull-right text-white hide"><i class="fa fa-print text-white"></i> Print</a>
                    </div>

                    <div class="w-100"></div>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="box-body box-min-height" id="print">
    <div class="table-responsive" id="allLadgerAppend">
        
    </div>
</div>
