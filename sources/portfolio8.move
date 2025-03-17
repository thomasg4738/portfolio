module portfolio::portfolio8;
use std::u8::min;
use portfolio::asset::{Asset, new_asset, trailing_zeros};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use std::u64::pow;
use sui::url::Url;

public struct Portfolio8<
    phantom T,
    phantom C0,
    phantom C1,
    phantom C2,
    phantom C3,
    phantom C4,
    phantom C5,
    phantom C6,
    phantom C7,
> has key, store {
    id: UID,
    treasury_cap: TreasuryCap<T>,
    asset0: Asset<C0>,
    asset1: Asset<C1>,
    asset2: Asset<C2>,
    asset3: Asset<C3>,
    asset4: Asset<C4>,
    asset5: Asset<C5>,
    asset6: Asset<C6>,
    asset7: Asset<C7>,
}

public fun create_portfolio8<
    T: drop,
    C0,
    C1,
    C2,
    C3,
    C4,
    C5,
    C6,
    C7,
>(
    witness: T,
    amount0: u64,
    amount1: u64,
    amount2: u64,
    amount3: u64,
    amount4: u64,
    amount5: u64,
    amount6: u64,
    amount7: u64,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio8<T, C0, C1, C2, C3, C4, C5, C6, C7>, CoinMetadata<T>) {
    let decimals0 = trailing_zeros(amount0);
    let decimals1 = trailing_zeros(amount1);
    let decimals2 = trailing_zeros(amount2);
    let decimals3 = trailing_zeros(amount3);
    let decimals4 = trailing_zeros(amount4);
    let decimals5 = trailing_zeros(amount5);
    let decimals6 = trailing_zeros(amount6);
    let decimals7 = trailing_zeros(amount7);
    let decimals = min(
        min(min(min(min(min(min(decimals0, decimals1), decimals2), decimals3), decimals4), decimals5), decimals6),
        decimals7
    );
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
        Portfolio8 {
            id: object::new(ctx),
            treasury_cap,
            asset0: new_asset<C0>(amount0 / zeros),
            asset1: new_asset<C1>(amount1 / zeros),
            asset2: new_asset<C2>(amount2 / zeros),
            asset3: new_asset<C3>(amount3 / zeros),
            asset4: new_asset<C4>(amount4 / zeros),
            asset5: new_asset<C5>(amount5 / zeros),
            asset6: new_asset<C6>(amount6 / zeros),
            asset7: new_asset<C7>(amount7 / zeros),
        },
        c,
    )
}

public fun mint_portfolio8<T: drop, C0, C1, C2, C3, C4, C5, C6, C7>(
    input_coin0: Coin<C0>,
    input_coin1: Coin<C1>,
    input_coin2: Coin<C2>,
    input_coin3: Coin<C3>,
    input_coin4: Coin<C4>,
    input_coin5: Coin<C5>,
    input_coin6: Coin<C6>,
    input_coin7: Coin<C7>,
    portfolio: &mut Portfolio8<T, C0, C1, C2, C3, C4, C5, C6, C7>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<T> {
    portfolio.asset0.deposit(input_coin0, amount);
    portfolio.asset1.deposit(input_coin1, amount);
    portfolio.asset2.deposit(input_coin2, amount);
    portfolio.asset3.deposit(input_coin3, amount);
    portfolio.asset4.deposit(input_coin4, amount);
    portfolio.asset5.deposit(input_coin5, amount);
    portfolio.asset6.deposit(input_coin6, amount);
    portfolio.asset7.deposit(input_coin7, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio8<T: drop, C0, C1, C2, C3, C4, C5, C6, C7>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio8<T, C0, C1, C2, C3, C4, C5, C6, C7>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>, Coin<C2>, Coin<C3>, Coin<C4>, Coin<C5>, Coin<C6>, Coin<C7>) {
    let amount = portfolio_coin.value();
    burn(&mut portfolio.treasury_cap, portfolio_coin);

    (
        portfolio.asset0.withdraw(amount, ctx),
        portfolio.asset1.withdraw(amount, ctx),
        portfolio.asset2.withdraw(amount, ctx),
        portfolio.asset3.withdraw(amount, ctx),
        portfolio.asset4.withdraw(amount, ctx),
        portfolio.asset5.withdraw(amount, ctx),
        portfolio.asset6.withdraw(amount, ctx),
        portfolio.asset7.withdraw(amount, ctx),
    )
}