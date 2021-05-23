pragma solidity ^0.4.18;

contract MySuperContract {
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    string public constant name = "Sodol";
    string public constant symbol = "SDL";
    uint8 public constant decimals = 18;
    uint public totalSupply = 0;
    
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowed;
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
	
    function transfer(address _to, uint _value) public returns (bool success) {
        if(balances[msg.sender] >= _value && balances[_to] + _value >= balances[_to]) {
            balances[msg.sender] -= _value; 
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } 
        return false;
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        if( allowed[_from][msg.sender] >= _value &&
            balances[_from] >= _value 
            && balances[_to] + _value >= balances[_to]) {
            allowed[_from][msg.sender] -= _value;
            balances[_from] -= _value; 
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        } 
        return false;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    function mint(address _to, uint _value) public {
      assert(totalSupply + _value >= totalSupply && balances[_to] + _value >= balances[_to]);
      balances[_to] += _value;
      totalSupply += _value;
    }

}
