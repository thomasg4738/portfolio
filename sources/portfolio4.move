module portfolio::portfolio4;
use std::u64::pow;
use std::u8::min;
use portfolio::asset::{Asset, new_asset, trailing_zeros};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use sui::url::Url;

public struct Portfolio4<phantom T, phantom C0, phantom C1, phantom C2, phantom C3> has key, store {
    id: UID,
    treasury_cap: TreasuryCap<T>,
    asset0: Asset<C0>,
    asset1: Asset<C1>,
    asset2: Asset<C2>,
    asset3: Asset<C3>,
}

public fun create_portfolio4<T: drop, C0, C1, C2, C3>(
    witness: T,
    amount0: u64,
    amount1: u64,
    amount2: u64,
    amount3: u64,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio4<T, C0, C1, C2, C3>, CoinMetadata<T>) {
    let decimals0 = trailing_zeros(amount0);
    let decimals1 = trailing_zeros(amount1);
    let decimals2 = trailing_zeros(amount2);
    let decimals3 = trailing_zeros(amount3);
    let decimals = min(min(min(decimals0, decimals1), decimals2), decimals3);
    let zeros = pow(10, decimals);

    let (treasury_cap, c) = create_currency(
        witness,
        decimals,
        symbol,
        name,
        description,
        icon_url,
        ctx
    );
    (
        Portfolio4 {
            id: object::new(ctx),
            treasury_cap,
            asset0: new_asset<C0>(amount0 / zeros),
            asset1: new_asset<C1>(amount1 / zeros),
            asset2: new_asset<C2>(amount2 / zeros),
            asset3: new_asset<C3>(amount3 / zeros),
        },
        c,
    )
}

public fun mint_portfolio4<T: drop, C0, C1, C2, C3>(
    input_coin0: Coin<C0>,
    input_coin1: Coin<C1>,
    input_coin2: Coin<C2>,
    input_coin3: Coin<C3>,
    portfolio: &mut Portfolio4<T, C0, C1, C2, C3>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<T> {
    portfolio.asset0.deposit(input_coin0, amount);
    portfolio.asset1.deposit(input_coin1, amount);
    portfolio.asset2.deposit(input_coin2, amount);
    portfolio.asset3.deposit(input_coin3, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio4<T: drop, C0, C1, C2, C3>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio4<T, C0, C1, C2, C3>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>, Coin<C2>, Coin<C3>) {
    let amount = portfolio_coin.value();
    burn(&mut portfolio.treasury_cap, portfolio_coin);

    (
        portfolio.asset0.withdraw(amount, ctx),
        portfolio.asset1.withdraw(amount, ctx),
        portfolio.asset2.withdraw(amount, ctx),
        portfolio.asset3.withdraw(amount, ctx),
    )
}