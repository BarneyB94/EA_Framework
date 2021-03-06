//+------------------------------------------------------------------+
//|                                                IndicatorBase.mqh |
//|                                               Alekzander Bywater |
//|                                     https://github.com/BarneyB94 |
//+------------------------------------------------------------------+ 
#include	"CommonBase.mqh"

class CIndicatorBase : public CCommonBase {

private:

protected:	// member variables

public:	// constructors

	CIndicatorBase()			:	CCommonBase()
									{	Init();	}
	CIndicatorBase(string symbol, ENUM_TIMEFRAMES timeframe)
									:	CCommonBase(symbol, timeframe)
									{	Init();	}
	~CIndicatorBase();
	
	int			Init();

public:

   virtual double    GetData(const int index) 							{ return(GetData(0,index)); }
   virtual double    GetData(const int bufferNum, const int index){ return (0); }

};

CIndicatorBase::~CIndicatorBase() {

}

int		CIndicatorBase::Init() {

	if (InitResult()!=INIT_SUCCEEDED)	return(InitResult());
	
	return(INIT_SUCCEEDED);
	
}



