//
//  DefineNSUserDefault.h
//  KingShop
//
//  Created by ChenRongQin on 16/5/3.
//  Copyright © 2016年 jav. All rights reserved.
//

#ifndef DefineNSUserDefault_h
#define DefineNSUserDefault_h



#define Login_access_token  (@"Login_access_token")   //

#define Login_birthday  (@"Login_birthday")   //

#define Login_create_time   (@"Login_create_time")    //

#define Login_user_id   (@"Login_user_id")   //

#define Login_is_post_comment  (@"Login_is_post_comment")  //

#define Login_mobile_phone   (@"Login_mobile_phone")  //

#define Login_resident   (@"Login_resident")  //

#define Login_status  (@"Login_status")  //

#define Login_user_icon   (@"Login_user_icon")   //

#define Login_user_name  (@"Login_user_name")  //

#define Login_user_sex   (@"Login_user_sex")   //

#define Login_IM_account  (@"Login_IM_account")
#define Login_IM_password (@"Login_IM_password")

#define Login_is_bind_line   (@"Login_is_bind_line")   //
#define Login_is_bind_wechat   (@"Login_is_bind_wechat")   //
#define Login_is_bind_facebook   (@"Login_is_bind_facebook")   //
////////////////////////////////////////////////////////////////////////////////////////////////////

#define Login_isLogin (@"Login_isLogin")   //是否登录状态

#define Login_password (@"Login_password")   //登录密码

#define hot_Goods (@"hot_Goods")     //热门商品

#define history_Goods (@"history_Goods")    //历史记录

#define WaitCommentNum (@"wait_comment_num")   //待评价

#define WaitDeliverNum (@"wait_deliver_num")   //待发货

#define WaitPayNum (@"wait_pay_num")   //待支付

#define WaitReceiveNum (@"wait_receive_num")   //待收货

#define CustomerOrderNum (@"customer_order_num")   //待处理售后

#define updateOrderList (@"updateOrderList") //刷新订单

#define showRedImgNum   (@"showRedImgNum")   //是否显示系统提示红点
#define upDataMessageTable (@"upDataMessageTable")  //刷新消息列表

#define updateMyOrderList (@"updateMyOrderList") //刷新我的订单
#define deleteMyOrderList (@"deleteMyOrderList") //删除订单

#define paymentMyOrder    (@"paymentMyOrder")   //付款
#define updateBankDate    (@"updateBankDate")   //更新银行
#define ConfirmTheGoods   (@"ConfirmTheGoods")  //确认收货
#define EvaluationMyOrderGoods (@"EvaluationMyOrderGoods")    //评价商品
#define cancelMyOrder     (@"cancelMyOrder")    //取消订单

#define Login_isIMLogin (@"Login_isIMLogin")   //是否登录状态
//#define NSUserDefault_passwordY (@"passwordY")  //密码（未加密命名特殊，用时需注意）
//
//#define NSUserDefault_talPhoneArray  (@"talPhoneArray")  //电话号码数组
//
//#define NSUserDefault_Automatic   (@"Automatic")    //是否是自动登录
//
//#define NSUserDefault_isMasterLogin   (@"isMasterLogin")    //是否是店长登录
//
//#define NSUserDefault_staffNumber   (@"staffNumber")    //员工工号



#define ForPaymentOrederStatus ([NSString getLaoWithChiness:@"等待付款"]) //待付款
#define PaymentBeenOrederStatus ([NSString getLaoWithChiness:@"已付款待确认"]) //已付款
#define SendGoodsOrederStatus ([NSString getLaoWithChiness:@"等待发货"]) //待发货
#define BeenShippedOrederStatus ([NSString getLaoWithChiness:@"卖家已发货"]) //已发货
#define DealOrederStatus ([NSString getLaoWithChiness:@"交易成功"]) //交易完成
#define TransactionCancelledOrederStatus ([NSString getLaoWithChiness:@"交易取消"]) //交易取消
#define TradingClosedOrederStatus ([NSString getLaoWithChiness:@"交易关闭"]) //交易关闭
#define PleaseWaitforProcessing ([NSString getLaoWithChiness:@"卖家处理中"])   //卖家处理中
#define ApplicationIsSuccessful ([NSString getLaoWithChiness:@"申请成功"])   //申请成功
#define ApplyforFailure ([NSString getLaoWithChiness:@"申请失败"])       //申请失败



#endif /* DefineNSUserDefault_h */
