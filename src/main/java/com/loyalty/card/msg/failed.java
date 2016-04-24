/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.loyalty.card.msg;

/**
 *
 * @author mrinal
 */
public class failed {
    String reg_failed="Registraton Failed";
    String allready_exist= "Allready Exist";
    String login_failed= "Invalid login";
    
    public  failed(){
    }
    public String getRegFailed(){
        return  reg_failed;
    }
    public String getAllrdyExist(){
        return  allready_exist;
    }
    
     public String getInvalidLogin(){
        return  login_failed;
    }
    
}
