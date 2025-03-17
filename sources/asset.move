module portfolio::asset;
use sui::balance::{Balance, zero};
use sui::coin::{Coin, into_balance, from_balance};

public struct Asset<phantom T> has store {
    amount_per_unit: u64,
    balance: Balance<T>
}

public fun new_asset<T>(amount_per_unit: u64): Asset<T> {
    Asset<T> {
        amount_per_unit,
        balance: zero<T>()
    }
}

public fun trailing_zeros(n: u64): u8 {
    let mut count = 0;
    let mut value = n;
    while (value % 10 == 0 && value != 0) {
        count = count + 1;
        value = value / 10;
    };
    count
}

public fun deposit<C>(
    self: &mut Asset<C>,
    input_coin: Coin<C>,
    amount: u64,
) {
    let deposit_amount = self.amount_per_unit * amount;
    let input_balance = into_balance<C>(input_coin);
    assert!(deposit_amount == input_balance.value(), 0);
    self.balance.join(input_balance);
}

public fun withdraw<C>(
    self: &mut Asset<C>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<C> {
    let withdraw_amount = self.amount_per_unit * amount;
    let output = self.balance.split(withdraw_amount);
    from_balance(output, ctx)
}