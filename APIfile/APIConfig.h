//
//  APIConfig.h
//  Family Mobile
//
//  Created by java on 16/3/26.
//  Copyright © 2016年 Jian. All rights reserved.
//

#ifndef APIConfig_h
#define APIConfig_h

#define WEBAPI_SWITCH 0
#if WEBAPI_SWITCH==1
#define WEBAPI_SERVER @"http://api.neestore.cc/app"//正式
#elif WEBAPI_SWITCH==0
#define WEBAPI_SERVER @"http://apitest.neestore.yunpos.net/app"//测试
#endif

//获取挡屏
#define GetScreenInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"index",@"getscreeninfo"]

//获取首页菜单列表
#define GetIndexTabListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"index",@"gettablist"]

//获取专题页信息
#define GetTopicPageAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"topic",@"getTopicPage"]

//获取购物车数量
#define GetCartNumAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getcartnum"]

//购物首页
#define IndexIndexAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"index",@"index"]
//获取商品详细
#define GoodsGetgoodsinfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getgoodsinfo"]
//获取分类列表
#define GoodsGetClassAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getclass"]
//获取商品列表
#define GoodsGetgoodslistAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getgoodslist"]
//获取商品所有评论列表
#define GoodsGetgoodscommentlistAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getgoodscommentlist"]
//收藏\取消收藏商品
#define GoodsAddgoodsfavoriteAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"addgoodsfavorite"]
//店铺首页
#define StoreIndexAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"index"]
//收藏\取消收藏店铺
#define StoreAddstorefavoriteAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"addstorefavorite"]
//店铺信息
#define StoreGetstoreInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"getstoreinfo"]
//获取店铺全部商品列表
#define StoreGetStoreAllGoodsListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"getstoreallgoodslist"]
//获取店铺分类下的商品列表
#define StoreGetStoreClassGoodsListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"getstoreclassgoodslist"]
//加入购物车
#define OrderAddcartAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"addcart"]
//获取搜索热词
#define SystemGetkeywordAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getkeyword"]
//确认订单
#define OrderConfirmorderAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"confirmorder"]
//修改购物车
#define OrderUpdatecartAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"updatecart"]
//获取银行列表
#define OrderGetbankListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getbanklist"]
//获取现金券列表
#define OrderGetcashcouponListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getcashcouponlist"]
//提交订单
#define OrderSubmitorderAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"submitorder"]
//提交转账截图
#define OrderSubmitorDertransFervoucherAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"submitordertransfervoucher"]
//更新订单银行
#define OrderChangeOrderBankAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"changeorderbank"]
//猜你喜欢\推荐商品列表
#define IndexGetRecommendGoodsListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"index",@"getrecommendgoodslist"]
//获取购物车列表
#define OrderGetcartAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getcart"]
//消息首页
#define SystemGetnewsAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getnews"]
//获取官方通知消息
#define SystemGetSystemNewsAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getsystemnews"]
//获取系统通知消息
#define SystemGetSystemMessageAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getsystemmessage"]
//删除系统通知消息
#define SystemDelSystemMessageAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"delsystemmessage"]
//获取消息设置信息
#define SystemGetUserSettingAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getusersetting"]
//修改消息设置
#define SystemUpdateUserSettingAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"updateusersetting"]
//获取我的订单列表
#define OrderGetorDerListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getorderlist"]
//删除订单
#define OrderDelorderAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"delorder"]
//更新订单状态(取消订单、确认收货)
#define OrderUpdateOrderStateAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"updateorderstate"]
//获取我的订单详细
#define OrderGetOrderInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getorderinfo"]
//再次购买订单(成功后自动跳转购物车)
#define OrderRebuyOrderGoodsAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"rebuyordergoods"]
//评价商品
#define OrderAddGoodsCommentAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"addgoodscomment"]
//获取商品评价详细
#define GoodsGetGoodsCommentinfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getgoodscommentinfo"]
//提交售后申请
#define OrderApplyOrderCustomerAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"applyordercustomer"]
//查看售后申请信息
#define OrderGetOrderCustomerInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getordercustomerinfo"]
//获取售后列表
#define OrderGetOrderCustomerListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getordercustomerlist"]
//获取最新版本
#define SystemGetLastVersionInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getlastversioninfo"]
//获取启动页
#define SystemGetStartPageAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getstartpage"]
//获取文字说明
#define SystemGetModuleDescAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getmoduledesc"]
/**
 *  我的模块
 */
//注册发送验证码
#define MineMemberSendCodeAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"sendCode"]
//注册校验验证码
#define MineMemberVerifyCodeAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"verifyCode"]
//用户注册
#define MineMemberRegisterAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"register"]
//用户协议
#define MineGetagreementAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getagreement"]
//用户登录
#define MineUserLoginAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"login"]
//找回密码
#define MineFindUserPasswordAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"finduserpassword"]

//获取用户信息
#define MineGetUserInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"getuserinfo"]

//更新用户信息
#define MineUpdateUserInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"updateuserinfo"]

//获取地区(省份列表、城市列表)
#define MineGetAreaListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getarealist"]

//38.	添加、修改收货地址（登录）
#define MineSaveAddressAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"saveaddress"]

//36.	获取我的收货地址列表（登录）
#define MineGetMyAddressListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"getmyaddresslist"]

//40.	删除收货地址（登录）
#define MineDelAddressAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"deladdress"]

//39.	更新地址为默认地址（登录）
#define MineUpdateAddressAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"updateaddress"]

//10.	意见反馈类型
#define MineGetFeedbackTypeListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getfeedbacktypelist"]

//11.	提交意见反馈
#define MineSubmitFeedbackAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"submitfeedback"]

//获取现金券列表
#define MineGetCashCouponListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"order",@"getcashcouponlist"]

//获取我收藏店铺列表
#define MineGetMyFavoriteStoreListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"store",@"getmyfavoritestorelist"]

//获取我收藏商品列表
#define MineGetMyFavoriteGoodsListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"goods",@"getmyfavoritegoodslist"]


//获取我发布的帖子列表（我的模块）
#define MineGetMemberPostListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getmemberpostlist"]

//获取我参与的帖子列表（我的模块）
#define MineGetMemberThreadListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getmemberthreadlist"]

//获取评论我的列表（评论我的帖子、回复我的评论2种情况）
#define MineGetMemberThreadCommentListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getmemberthreadcommentlist"]


//获取帮助中心列表
#define MineGetHelpAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"gethelp"]

//推荐有奖
#define MineInviteAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"invite"]

//邀请用户列表
#define MineGetInviteMemberListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"getinvitememberlist"]

//2.	第三方平台快捷登录
#define MineQuickLoginAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"quicklogin"]

//3.	第三方绑定账号
#define MineThirdBindAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"bind"]

//4.	删除第三方绑定账号(登录状态)
#define MineDelBindAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"member",@"delbind"]

//24.	获取文字说明
#define MineGetModuleDescAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"getmoduledesc"]

/**
 *  社区模块
 */
//获取我收藏帖子列表
#define CommunityGetMyFavoritePostListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getmyfavoritepostlist"]

//收藏\取消收藏帖子
#define CommunityAddPostFavoriteAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"addpostfavorite"]

//17.	获取社区分类
#define CommunityGetClassListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getclasslist"]

//提交帖子
#define CommunityAddPostAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"addpost"]

//18.	获取帖子列表
#define CommunityGetPostListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getpostlist"]

//获取专题帖子列表
#define CommunityGetTopicPostListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getposttopicpostlist"]

//点赞\取消点赞帖子
#define CommunityAddPostSupportAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"addpostsupport"]

//获取帖子详细
#define CommunityGetPostInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getpostinfo"]


//获取点赞用户列表
#define CommunityGetPostSupportMemberListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getpostsupportmemberlist"]

//提交举报
#define CommunitySubmitReportAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"system",@"submitreport"]

//获取帖子评论列表
#define CommunityGetPostThreadListAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getpostthreadlist"]

//提交评论楼主
#define CommunityAddPostThreadAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"addpostthread"]

//提交评论回复
#define CommunityAddPostThreadCommentAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"addpostthreadcomment"]

//获取帖子评论详细
#define CommunityGetPostThreadInfoAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"post",@"getpostthreadinfo"]
//进入聊天界面(登录状态)
#define ImDialogueAPI [NSString stringWithFormat:@"%@/%@/%@",WEBAPI_SERVER,@"im",@"dialogue"]

#endif /* APIConfig_h */
