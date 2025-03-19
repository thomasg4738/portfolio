module portfolio::portfolio18;

use portfolio::asset::{Asset, new_asset};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use sui::url::Url;

public struct Portfolio18<phantom T, phantom C0, phantom C1, phantom C2, phantom C3, phantom C4, phantom C5, phantom C6, phantom C7, phantom C8, phantom C9, phantom C10, phantom C11, phantom C12, phantom C13, phantom C14, phantom C15, phantom C16, phantom C17> has key, store {
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
    asset8: Asset<C8>,
    asset9: Asset<C9>,
    asset10: Asset<C10>,
    asset11: Asset<C11>,
    asset12: Asset<C12>,
    asset13: Asset<C13>,
    asset14: Asset<C14>,
    asset15: Asset<C15>,
    asset16: Asset<C16>,
    asset17: Asset<C17>,
}

public fun create_portfolio18<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>(
    witness: T,
    amount0: u64,
    amount1: u64,
    amount2: u64,
    amount3: u64,
    amount4: u64,
    amount5: u64,
    amount6: u64,
    amount7: u64,
    amount8: u64,
    amount9: u64,
    amount10: u64,
    amount11: u64,
    amount12: u64,
    amount13: u64,
    amount14: u64,
    amount15: u64,
    amount16: u64,
    amount17: u64,
    decimals: u8,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio18<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>, CoinMetadata<T>) {
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
        Portfolio18 {
            id: object::new(ctx),
            treasury_cap,
            asset0: new_asset<C0>(amount0),
            asset1: new_asset<C1>(amount1),
            asset2: new_asset<C2>(amount2),
            asset3: new_asset<C3>(amount3),
            asset4: new_asset<C4>(amount4),
            asset5: new_asset<C5>(amount5),
            asset6: new_asset<C6>(amount6),
            asset7: new_asset<C7>(amount7),
            asset8: new_asset<C8>(amount8),
            asset9: new_asset<C9>(amount9),
            asset10: new_asset<C10>(amount10),
            asset11: new_asset<C11>(amount11),
            asset12: new_asset<C12>(amount12),
            asset13: new_asset<C13>(amount13),
            asset14: new_asset<C14>(amount14),
            asset15: new_asset<C15>(amount15),
            asset16: new_asset<C16>(amount16),
            asset17: new_asset<C17>(amount17),
        },
        c,
    )
}

public fun mint_portfolio18<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>(
    input_coin0: Coin<C0>,
    input_coin1: Coin<C1>,
    input_coin2: Coin<C2>,
    input_coin3: Coin<C3>,
    input_coin4: Coin<C4>,
    input_coin5: Coin<C5>,
    input_coin6: Coin<C6>,
    input_coin7: Coin<C7>,
    input_coin8: Coin<C8>,
    input_coin9: Coin<C9>,
    input_coin10: Coin<C10>,
    input_coin11: Coin<C11>,
    input_coin12: Coin<C12>,
    input_coin13: Coin<C13>,
    input_coin14: Coin<C14>,
    input_coin15: Coin<C15>,
    input_coin16: Coin<C16>,
    input_coin17: Coin<C17>,
    portfolio: &mut Portfolio18<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>,
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
    portfolio.asset8.deposit(input_coin8, amount);
    portfolio.asset9.deposit(input_coin9, amount);
    portfolio.asset10.deposit(input_coin10, amount);
    portfolio.asset11.deposit(input_coin11, amount);
    portfolio.asset12.deposit(input_coin12, amount);
    portfolio.asset13.deposit(input_coin13, amount);
    portfolio.asset14.deposit(input_coin14, amount);
    portfolio.asset15.deposit(input_coin15, amount);
    portfolio.asset16.deposit(input_coin16, amount);
    portfolio.asset17.deposit(input_coin17, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio18<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio18<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>, Coin<C2>, Coin<C3>, Coin<C4>, Coin<C5>, Coin<C6>, Coin<C7>, Coin<C8>, Coin<C9>, Coin<C10>, Coin<C11>, Coin<C12>, Coin<C13>, Coin<C14>, Coin<C15>, Coin<C16>, Coin<C17>) {
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
        portfolio.asset8.withdraw(amount, ctx),
        portfolio.asset9.withdraw(amount, ctx),
        portfolio.asset10.withdraw(amount, ctx),
        portfolio.asset11.withdraw(amount, ctx),
        portfolio.asset12.withdraw(amount, ctx),
        portfolio.asset13.withdraw(amount, ctx),
        portfolio.asset14.withdraw(amount, ctx),
        portfolio.asset15.withdraw(amount, ctx),
        portfolio.asset16.withdraw(amount, ctx),
        portfolio.asset17.withdraw(amount, ctx),
    )
}

