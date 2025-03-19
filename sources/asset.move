module portfolio::asset;
use sui::balance::{Balance, zero};
use sui::coin::{Coin, into_balance, from_balance};

public struct Asset<phantom T> has store {
    /// amount per unit
    amount: u64,
    balance: Balance<T>
}

public fun new_asset<T>(amount: u64): Asset<T> {
    Asset<T> {
        amount,
        balance: zero<T>()
    }
}

public fun deposit<C>(
    self: &mut Asset<C>,
    input_coin: Coin<C>,
    amount: u64,
) {
    let deposit_amount = self.amount * amount;
    let input_balance = into_balance<C>(input_coin);
    assert!(deposit_amount == input_balance.value(), 0);
    self.balance.join(input_balance);
}

public fun withdraw<C>(
    self: &mut Asset<C>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<C> {
    let withdraw_amount = self.amount * amount;
    let output = self.balance.split(withdraw_amount);
    from_balance(output, ctx)
}