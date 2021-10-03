package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1683:String = "pricing_model_unknown";
      
      public static const const_399:String = "pricing_model_single";
      
      public static const const_420:String = "pricing_model_multi";
      
      public static const const_614:String = "pricing_model_bundle";
      
      public static const const_1708:String = "price_type_none";
      
      public static const const_773:String = "price_type_credits";
      
      public static const const_1198:String = "price_type_activitypoints";
      
      public static const const_1266:String = "price_type_credits_and_activitypoints";
       
      
      private var var_712:String;
      
      private var var_1104:String;
      
      private var var_1283:int;
      
      private var var_1644:String;
      
      private var var_1103:int;
      
      private var var_1102:int;
      
      private var var_1643:int;
      
      private var var_342:ICatalogPage;
      
      private var var_579:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2183:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this.var_1283 = param1;
         this.var_1644 = param2;
         this.var_1103 = param3;
         this.var_1102 = param4;
         this.var_1643 = param5;
         this.var_342 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_342;
      }
      
      public function get offerId() : int
      {
         return this.var_1283;
      }
      
      public function get localizationId() : String
      {
         return this.var_1644;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1103;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1102;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1643;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_579;
      }
      
      public function get pricingModel() : String
      {
         return this.var_712;
      }
      
      public function get priceType() : String
      {
         return this.var_1104;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2183;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2183 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1283 = 0;
         this.var_1644 = "";
         this.var_1103 = 0;
         this.var_1102 = 0;
         this.var_1643 = 0;
         this.var_342 = null;
         if(this.var_579 != null)
         {
            this.var_579.dispose();
            this.var_579 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_712)
         {
            case const_399:
               this.var_579 = new SingleProductContainer(this,param1);
               break;
            case const_420:
               this.var_579 = new MultiProductContainer(this,param1);
               break;
            case const_614:
               this.var_579 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_712);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_712 = const_399;
            }
            else
            {
               this.var_712 = const_420;
            }
         }
         else if(param1.length > 1)
         {
            this.var_712 = const_614;
         }
         else
         {
            this.var_712 = const_1683;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1103 > 0 && this.var_1102 > 0)
         {
            this.var_1104 = const_1266;
         }
         else if(this.var_1103 > 0)
         {
            this.var_1104 = const_773;
         }
         else if(this.var_1102 > 0)
         {
            this.var_1104 = const_1198;
         }
         else
         {
            this.var_1104 = const_1708;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_342.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_579.products)
         {
            _loc4_ = this.var_342.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
